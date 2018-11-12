input = "C:\\Users\\Marilene\\Desktop\\pdi_finaltrab\\cels\\";
output = "C:\\Users\\Marilene\\Desktop\\pdi_finaltrab\\gen_nucleos\\";

setBatchMode(true);
list = getFileList(input);
for (i=0; i<list.length; i++){
	filename = list[i];
	open(input+filename);
	run("Gaussian Blur...", "sigma=2.5");
	run("Auto Local Threshold", "method=Phansalkar radius=15 parameter_1=0 parameter_2=0 white");
	run("Convert to Mask");
	run("Analyze Particles...", "size=100-1200 circularity=0.80-1.00 show=Masks display summarize in_situ");
	run("Invert");
	saveAs("Jpeg", output+"gen_nuclei_"+filename);
	close();
}