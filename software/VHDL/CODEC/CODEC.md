@SOME good point about the FPGA use and its codec

Name codec : WM8731

Search about WM8731 use in Quartus Tuto 
16 register of 16 bit !!!


	ROM[0] = 16'h1e00;  -- 
		ROM[0] = 16'h0c00;	    			 //power down  , set up the divise, can be use (l'etat haut est l'etat éteint)
		ROM[1] = 16'h0ec2;	   		    	 //master, MSB-First, right justified, data bit length 16 bits, Right channel when DACLRC low, Right Channel DAC data Right, Enable slave mode, don't invert BCLK

		ROM[2] = 16'h0838;	    			 //
	
		ROM[3] = 16'h1000;					 //sound select, Normal mode (not usb), BORS=256 fs, 1110 : sample rate control,Clock core MCLK, CLOCKOUT is clock core 
	
		ROM[4] = 16'h0017;					 // enable Simultaneous load of LINVOL, Enable Left Channel line imput Mute to ADC, Left Channels Line Imput Volume Control

		ROM[5] = 16'h0217;					 // Same as h00 but for the Right

		ROM[6] = {8'h04,1'b0,volume[6:0]};		 // volumem control L

		ROM[7] = {8'h06,1'b0,volume[6:0]};	     //sound vol R
	
		//ROM[4]= 16'h1e00;		             //reset	
		ROM[`rom_size]= 16'h1201;            //active  if become 0000000 reset the divise