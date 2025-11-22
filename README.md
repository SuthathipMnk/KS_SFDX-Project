# KS_SFDX-Project

This repository contain only Apex Class that used for building JSON Payload.

**How to run the code**
1. Copy this code into your Salesforce Org.
2. Run by "Execute Anonymous" In Developer Mode.
3. Copy these code below into "Execute Anonymous" window. for each Product.
   - Product A
     ```Apex
     		SysAB_ProductFormController.ProductFormWrapper req = new SysAB_ProductFormController.ProductFormWrapper();
				
				req.productType = 'PA';
				req.clientId = 'C001';
				req.accountNo = '123456';
				req.accountName = 'John Smith';
				req.purpose = 'Test';
				req.requester = 'Sam';
				req.checker = 'Bob';
				
				// Product A fields
				req.paHasD0 = true;
				req.paD0Time = '15:30';
				req.paHasD1 = true;
				req.paD1Time = '16:00';
				req.paBatchRef = 'B001';
				req.paDebitAccNo = 'D8888999';
				
				// Call method
				String resultA = SysAB_ProductFormController.buildBodyRequest(req);
				System.debug('Product A Payload');
				System.debug(resultA);

	- Product B
  		```Apex
     	SysAB_ProductFormController.ProductFormWrapper req = new SysAB_ProductFormController.ProductFormWrapper();

			req.productType = 'PB';
			req.clientId = 'C002';
			req.accountNo = '567890';
			req.accountName = 'Miki way';
			req.purpose = 'Test';
			req.requester = 'Sam';
			req.checker = 'Bob';
			
			// Product B fields
			req.pbCycle = 'Monthly';
			req.pbFileFormat = 'PDF';
			req.pbCompanyCode = 'COMP567443';
			
			String resultB = SysAB_ProductFormController.buildBodyRequest(req);
			System.debug('Product B Payload');
			System.debug(resultB);

	- Product C
  		```Apex
  		SysAB_ProductFormController.ProductFormWrapper req = new SysAB_ProductFormController.ProductFormWrapper();

		req.productType = 'PC';
		req.clientId = 'C003';
		req.accountNo = '1122334';
		req.accountName = 'XYZ Ltd';
		req.purpose = 'Test';
		req.requester = 'Sam';
		req.checker = 'Bob';
		
		// Product C fields
		req.pcDebitAccNo = '101010';
		req.pcWithholding = true;
		req.pcPriority = 'High';
		
		String resultC = SysAB_ProductFormController.buildBodyRequest(req);
		System.debug('Product C Payload');
		System.debug(resultC);
   
4. Check the result in log.




