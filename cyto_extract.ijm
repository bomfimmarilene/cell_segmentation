input = "C:\\Users\\Marilene\\Desktop\\pdi_finaltrab\\cels\\";
output = "C:\\Users\\Marilene\\Desktop\\pdi_finaltrab\\mass\\";

setBatchMode(true);
list = getFileList(input);
for (i=0; i<list.length; i++){
	filename = list[i];
	open(input+filename);
	run("Subtract Background...", "rolling=20 light create");
	run("Auto Threshold", "method=Huang ignore_black ignore_white white");
	open("C:\\Users\\Marilene\\Desktop\\pdi_finaltrab\\border.jpg");
	imageCalculator("Add create", filename,"border.jpg");
	
	
	run("Invert");
	saveAs("Jpeg", output+filename+"_mas");
	close();
	close();
	close();
}