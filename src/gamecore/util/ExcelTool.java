package gamecore.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 */
public final class ExcelTool {

	private static final int VER2003 = 2003;

	private static final int VER2007 = 2007;

	public static List<List<Object>> readExcel(String excelFilePath) throws IOException {

		int version = VER2003;

		if (excelFilePath.endsWith(".xlsx"))
			version = VER2007;

		InputStream stream = new FileInputStream(excelFilePath);

		Workbook wb = null;

		if (version == VER2003) {
			wb = (Workbook) new HSSFWorkbook(stream);
		} else {
			wb = (Workbook) new XSSFWorkbook(stream);
		}

		Sheet sheet = wb.getSheetAt(0);

		List<List<Object>> result = new ArrayList<List<Object>>();

		// 行数(从0开始,相当于最后一行的索引),列数

		int countRow = sheet.getLastRowNum();
		int countCell = sheet.getRow(0).getPhysicalNumberOfCells();

		Row row = null;
		Cell cell = null;

		for (int i = 0; i <= countRow; i++) {
			ArrayList<Object> list = new ArrayList<Object>();

			for (int j = 0; j < countCell; j++) {
				row = sheet.getRow(i);
				cell = row.getCell(j);
				Object objContent = null;
				if (null == cell) {
					objContent = null;
				} else {
					if (cell.getCellType() == Cell.CELL_TYPE_BLANK)
						objContent = null;
					else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC)
						objContent = Math.round(cell.getNumericCellValue());
					else if (cell.getCellType() == Cell.CELL_TYPE_STRING){
						objContent = cell.getStringCellValue();
						if (cell.getStringCellValue().toLowerCase().equals("na")) {
							objContent = null;
						}
					}
				}
				list.add(objContent);
			}

			result.add(list);
		}

		try {
			stream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
}
