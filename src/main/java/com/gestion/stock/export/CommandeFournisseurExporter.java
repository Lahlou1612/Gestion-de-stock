package com.gestion.stock.export;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gestion.stock.entites.CommandeFournisseur;
import com.gestion.stock.services.ICommandeFournisseurService;
import com.gestion.stock.utils.ApplicationConstants;
import com.mysql.jdbc.StringUtils;

import jxl.CellView;
import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.write.Label;
import jxl.write.WritableCellFeatures;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
@Component("commandeFournisseurExporter")
public class CommandeFournisseurExporter implements IFileExporter{
	@Autowired
	private ICommandeFournisseurService commandeService;

	@Override
	public boolean exportDataToExcel(HttpServletResponse response, String fileName, String encodage) {
		if(StringUtils.isEmptyOrWhitespaceOnly(fileName))
		{
			fileName = ApplicationConstants.FILE_NAME_COMMANDE_FOURNISSEUR;
		}
		if(StringUtils.isEmptyOrWhitespaceOnly(encodage)) {
			encodage = ApplicationConstants.DEFAULT_ENCODAGE;
		}
		response.setContentType(ApplicationConstants.EXCEL_CONTENT_TYPE);
		response.setHeader(ApplicationConstants.CONTENT_DISPOSITION, "attachment; filename ="+fileName+".xls");
		WorkbookSettings workbookSettings = new WorkbookSettings();
		workbookSettings.setEncoding(encodage);
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(response.getOutputStream(), workbookSettings);
			WritableSheet sheet = workbook.createSheet(fileName, 0);
			
			/*Sheet Header*/
			Label labelID= new Label(0, 0, ApplicationConstants.ID_COMMANDE_CLIENT);
			labelID.setCellFeatures(new WritableCellFeatures());
			labelID.getCellFeatures().setComment("");
			sheet.addCell(labelID);
			
			Label labelCode= new Label(1, 0, ApplicationConstants.CODE_COMMANDE_CLIENT);
			labelCode.setCellFeatures(new WritableCellFeatures());
			labelCode.getCellFeatures().setComment("");
			sheet.addCell(labelCode);
			
			Label labelDate= new Label(2, 0, ApplicationConstants.DATE_COMMANDE_CLIENT);
			labelDate.setCellFeatures(new WritableCellFeatures());
			labelDate.getCellFeatures().setComment("");
			sheet.addCell(labelDate);
			
			Label labelClient= new Label(3, 0, ApplicationConstants.FOURNISSEUR);
			labelClient.setCellFeatures(new WritableCellFeatures());
			labelClient.getCellFeatures().setComment("");
			sheet.addCell(labelClient);
			

			
			int currentRow=1;
			List<CommandeFournisseur> commandeFournisseurs = commandeService.selectAll();
			if(commandeFournisseurs != null && !commandeFournisseurs.isEmpty()) {
				
				/*Writing in the sheet*/
				for (CommandeFournisseur fournisseur : commandeFournisseurs) {
					sheet.addCell(new Label(0,currentRow,fournisseur.getIdCommandeFournisseur().toString()));
					sheet.addCell(new Label(1,currentRow,fournisseur.getCode()));
					sheet.addCell(new Label(2,currentRow,fournisseur.getDateCommande().toString()));
					sheet.addCell(new Label(3,currentRow,fournisseur.getFournisseur().getNom()));
					currentRow++;
				}
				CellView cellView = new CellView();
				cellView.setAutosize(true);
				//cellView.setSize(500);
				sheet.setColumnView( 0, cellView);
				sheet.setColumnView( 1, cellView);
				sheet.setColumnView( 2, cellView);
				sheet.setColumnView( 3, cellView);
				
				/*Write to excel sheet*/
				workbook.write();
				
				/*Cloosing the woorkBook*/
				workbook.close();
				
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean importDataFromExcel() {
		return false;
	}
}
