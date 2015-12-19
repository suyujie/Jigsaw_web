package gamecore.servlet;

import gamecore.util.ClassUtils;

import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.annotation.WebFilter;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.FilterHolder;


/** Filter 简单维护器的封装，用于管理 Filter 。
 */
public final class FilterCapsule {

	private static Logger logger = LogManager.getLogger("FilterCapsule");

	private final static FilterCapsule instance = new FilterCapsule();

	private List<FilterHolder> holders;

	private FilterCapsule() {
		this.holders = new ArrayList<FilterHolder>();
	}

	public static FilterCapsule getInstance() {
		return FilterCapsule.instance;
	}

	public List<FilterHolder> getHolders() {
		return this.holders;
	}

	public void registerFilters(String packageName, ServletContextHandler context) {
		// 遍历指定包下的所有类文件
		Set<Class<?>> classes = ClassUtils.getClasses(packageName);
		Iterator<Class<?>> iter = classes.iterator();
		while (iter.hasNext()) {
			Class<?> cls = iter.next();
			Annotation[] anns = cls.getAnnotations();
			for (Annotation ann : anns) {
				if (ann instanceof WebFilter) {
					try {
						FilterHolder filter = new FilterHolder((Filter) cls.newInstance());
						WebFilter path = (WebFilter) ann;
						EnumSet<DispatcherType> dispatches = EnumSet.allOf(DispatcherType.class);
						context.addFilter(filter, path.urlPatterns()[0], dispatches);
						this.holders.add(filter);
					} catch (InstantiationException ie) {
						logger.error("registerFilters", ie);
					} catch (IllegalAccessException iae) {
						logger.error("registerFilters", iae);
					} catch (Exception e) {
						logger.error("registerFilters", e);
					}
					break;
				}
			}
		}
	}
}
