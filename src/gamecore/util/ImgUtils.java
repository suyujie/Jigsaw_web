package gamecore.util;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.commons.fileupload.FileItem;

import server.ConfigManager;

public class ImgUtils {

	/**
	 * 判断文件是否存在
	 */
	public static boolean isFileExist(String pathname) {
		try {
			File file = new File(pathname);
			return file.exists();
		} catch (Exception e) {
		}
		return false;
	}

	/**
	 * 获得指定文件的byte数组
	 */
	public static byte[] getBytes(String filePath) {
		byte[] buffer = null;
		try {
			File file = new File(filePath);
			if (!file.exists()) {
				return buffer;
			}
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream bos = new ByteArrayOutputStream(1000);
			byte[] b = new byte[1000];
			int n;
			while ((n = fis.read(b)) != -1) {
				bos.write(b, 0, n);
			}
			fis.close();
			bos.close();
			buffer = bos.toByteArray();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return buffer;
	}

	/**
	 * 根据byte数组，生成文件
	 */
	public static void getFile(byte[] bfile, String filePath, String fileName) {
		if (bfile != null) {
			BufferedOutputStream bos = null;
			FileOutputStream fos = null;
			File file = null;
			try {
				File dir = new File(filePath);
				if (!dir.exists()) {// 判断文件目录是否存在
					dir.mkdirs();
				}
				file = new File(filePath + fileName);
				if (!file.exists()) {
					file.createNewFile();
				}
				fos = new FileOutputStream(file);
				bos = new BufferedOutputStream(fos);
				bos.write(bfile);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (bos != null) {
					try {
						bos.close();
					} catch (IOException e1) {
						e1.printStackTrace();
					}
				}
				if (fos != null) {
					try {
						fos.close();
					} catch (IOException e1) {
						e1.printStackTrace();
					}
				}
			}
		}
	}

	/**
	 * 处理上传文件
	 * 
	 * @param path
	 * @param item
	 * @return 文件名
	 * @throws Exception
	 */
	public static String processUploadedFile(String path, FileItem item) throws Exception {
		if (item == null || item.getName() == null || item.getName().equals("")) {
			return null;
		}
		String filename = item.getName();
		String fileTypeName = filename.substring(filename.lastIndexOf("."));
		filename = Utils.getOneId() + fileTypeName;

		// 路径是否存在
		File f_path = new File(path);
		if (!f_path.exists()) {
			f_path.mkdirs();
		}

		File uploadFile = new File(path + filename);
		// 文件是否存在
		if (!uploadFile.exists()) {
			try {
				uploadFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		item.write(uploadFile);
		return filename;
	}

	/**
	 * 生成缩略图
	 * 
	 * @param file
	 * @param targetW
	 * @param targetH
	 * @param thumbnailsuffix
	 * @throws IOException
	 */
	public static void resizeAndWrite(File file, int targetW, int targetH, String thumbnailsuffix) throws IOException {
		// 只有路径没有名字
		String parent = file.getParent();
		// 全名
		String fileName = file.getName();
		// 扩展名
		String fileTypeName = fileName.substring(fileName.lastIndexOf("."));
		String fileTypeNameWithOutDot = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 纯名称
		String nameWithOutType = fileName.substring(0, fileName.lastIndexOf("."));

		// 压缩后的新名字
		writeImage(resize(file, targetW, targetH, true), fileTypeNameWithOutDot,
				parent + File.separatorChar + nameWithOutType + thumbnailsuffix + fileTypeName);
	}

	public static void writeImage(BufferedImage image, String fileTypeName, String name) {

		File file = new File(name);
		if (!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		try {
			ImageIO.write(image, fileTypeName, new FileOutputStream(file));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 改变图片的尺寸
	 * 
	 * @param image
	 *            源文件
	 * @param targetW
	 *            目标宽
	 * @param targetH
	 *            目标高
	 * @param geometirc
	 *            等比缩放
	 */
	public static BufferedImage resize(File src_image, int targetW, int targetH, boolean geometric) throws IOException {
		BufferedImage image = ImageIO.read(src_image);
		int type = image.getType();
		BufferedImage target = null;
		double sx = (double) targetW / image.getWidth();
		double sy = (double) targetH / image.getHeight();
		// 等比缩放
		if (geometric) {
			if (sx > sy) {
				sx = sy;
				targetW = (int) (sx * image.getWidth());
			} else {
				sy = sx;
				targetH = (int) (sy * image.getHeight());
			}
		}
		if (type == BufferedImage.TYPE_CUSTOM) {
			ColorModel cm = image.getColorModel();
			WritableRaster raster = cm.createCompatibleWritableRaster(targetW, targetH);
			boolean alphaPremultiplied = cm.isAlphaPremultiplied();
			target = new BufferedImage(cm, raster, alphaPremultiplied, null);
		} else {
			// 固定宽高，宽高一定要比原图片大
			target = new BufferedImage(targetW, targetH, type);
		}

		Graphics2D g = target.createGraphics();

		// 写入
		g.drawImage(ImageIO.read(src_image), 0, 0, null);

		g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		g.drawRenderedImage(image, AffineTransform.getScaleInstance(sx, sy));
		g.dispose();

		return target;
	}

}
