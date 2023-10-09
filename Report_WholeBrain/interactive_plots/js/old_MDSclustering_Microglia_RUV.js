glimma.layout.setupGrid(d3.select(".container"), "md", [1,2]);
glimma.storage.chartData.push(glimma.transform.toRowMajor({"dim1":[-0.3719,-0.1864,-0.5163,-0.1221,0.3108,0.3136,0.3055,0.3968,-0.13],"dim2":[0.1464,0.594,-0.2121,-0.4436,0.00155,0.01898,-0.08427,0.03433,-0.05532],"dim3":[0.04378,0.2338,-0.14,0.47,-0.03692,-0.03389,-0.04826,0.03469,-0.5232],"dim4":[0.04429,-0.1022,0.3854,-0.2636,-0.0002312,-0.01152,0.1073,0.2171,-0.3766],"dim5":[-0.0001313,-0.001298,0.00212,-0.0007002,0.006731,0.008813,-0.009121,-0.004147,-0.002267],"dim6":[0.003013,-0.001261,-0.001213,-0.0005474,0.0003227,0.0007463,0.002114,-0.002279,-0.0008957],"dim7":[-2.189e-05,1.33e-06,7.405e-06,1.318e-05,-0.0007165,0.000605,1.959e-05,6.911e-05,2.277e-05],"label":["Veh_45M","Veh_46M","Veh_53M","Veh_8M","Flu_31M","Flu_42M","Flu_50M","Flu_51M","Flu_9M"],"groups":["Veh","Veh","Veh","Veh","Flu","Flu","Flu","Flu","Flu"]}));
glimma.storage.chartInfo.push({"x":"dim1","y":"dim2","id":[],"ndigits":[],"signif":6,"pntsize":4,"xlab":"Dimension 1","ylab":"Dimension 2","xjitter":0,"yjitter":0,"xord":false,"yord":false,"xlog":false,"ylog":false,"xgrid":false,"ygrid":false,"xstep":false,"ystep":false,"col":"groups","cfixed":false,"anno":["label","groups","dim1","dim2"],"annoLabels":[],"height":400,"width":500,"type":"scatter","title":"MDS Plot","flag":[],"info":{"groupsNames":"groups"},"hide":false,"disableClick":false,"disableHover":false,"disableZoom":false});
glimma.storage.charts.push(glimma.chart.scatterChart().height(400).width(500).size(function (d) { return 4; }).x(function (d) { return d["dim1"]; }).xlab("Dimension 1").xJitter(0).y(function (d) { return d["dim2"]; }).ylab("Dimension 2").yJitter(0).tooltip(glimma.storage.chartInfo[0].anno).title(glimma.storage.chartInfo[0].title).signif(6).col(function(d) { return d["groups"]; }));
glimma.storage.chartData.push(glimma.transform.toRowMajor({"name":[1,2,3,4,5,6,7,8],"eigen":[0.36,0.25,0.23,0.17,0,0,0,-0]}));
glimma.storage.chartInfo.push({"names":"name","y":"eigen","ndigits":[],"signif":6,"xlab":"Dimension","ylab":"Proportion","col":[],"anno":"eigen","height":300,"width":300,"type":"bar","title":"Variance Explained","flag":[],"info":{"dims":8}});
glimma.storage.charts.push(glimma.chart.barChart().height(300).width(300).id(function (d) { return d["name"]; }).xlab("Dimension").y(function (d) { return d["eigen"]; }).ylab("Proportion").title(glimma.storage.chartInfo[1].title).signif(6));
glimma.storage.tables.push(glimma.chart.table().data(glimma.storage.chartData[0]).columns(["label","groups"]));
glimma.layout.addTable(glimma.layout.bsAddRow(d3.select(".container")));
glimma.storage.linkage = [{"from":2,"to":1,"src":"none","dest":"none","flag":"mds","info":"none"},{"from":1,"to":1,"src":"click","dest":"highlightById","flag":"tablink","info":"none"}];
glimma.storage.input = [];
