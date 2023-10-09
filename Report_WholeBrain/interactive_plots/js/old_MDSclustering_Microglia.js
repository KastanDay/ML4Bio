glimma.layout.setupGrid(d3.select(".container"), "md", [1,2]);
glimma.storage.chartData.push(glimma.transform.toRowMajor({"dim1":[-0.2064,-0.3529,-0.3906,-0.2259,-0.259,-0.2964,-0.2576,-0.2583,2.645,-0.398],"dim2":[-0.472,0.3269,0.2638,0.3074,-0.6829,-0.4577,-0.794,1.166,0.03644,0.3063],"dim3":[0.8381,0.05995,-0.06103,0.2125,0.01255,-1.146,0.2061,0.002015,-0.03742,-0.08681],"dim4":[-0.6479,0.08174,0.05749,-0.08366,0.9791,-0.4935,-0.04805,0.04604,0.01602,0.09273],"dim5":[0.5089,-0.316,-0.115,-0.04762,0.442,0.2266,-0.7705,0.1787,-0.0248,-0.08228],"dim6":[-0.04089,0.1324,-0.5427,0.1332,0.08907,0.1021,0.2059,0.3771,-0.0399,-0.4163],"dim7":[0.1281,0.5885,-0.1185,-0.4985,-0.004101,0.01038,-0.127,-0.05518,0.01993,0.05641],"dim8":[-0.02936,0.05772,-0.4088,0.2492,-0.01434,0.0005814,-0.09272,-0.1828,0.0012,0.4193],"label":["Veh_45M","Veh_46M","Veh_53M","Veh_8M","Flu_31M","Flu_42M","Flu_50M","Flu_51M","Flu_59M","Flu_9M"],"Trt":["Veh","Veh","Veh","Veh","Flu","Flu","Flu","Flu","Flu","Flu"],"Sample":["45M","46M","53M","8M","31M","42M","50M","51M","59M","9M"]}));
glimma.storage.chartInfo.push({"x":"dim1","y":"dim2","id":[],"ndigits":[],"signif":6,"pntsize":4,"xlab":"Dimension 1","ylab":"Dimension 2","xjitter":0,"yjitter":0,"xord":false,"yord":false,"xlog":false,"ylog":false,"xgrid":false,"ygrid":false,"xstep":false,"ystep":false,"col":"Trt","cfixed":false,"anno":["label","Trt","Sample","dim1","dim2"],"annoLabels":[],"height":400,"width":500,"type":"scatter","title":"MDS Plot","flag":[],"info":{"groupsNames":["Trt","Sample"]},"hide":false,"disableClick":false,"disableHover":false,"disableZoom":false});
glimma.storage.charts.push(glimma.chart.scatterChart().height(400).width(500).size(function (d) { return 4; }).x(function (d) { return d["dim1"]; }).xlab("Dimension 1").xJitter(0).y(function (d) { return d["dim2"]; }).ylab("Dimension 2").yJitter(0).tooltip(glimma.storage.chartInfo[0].anno).title(glimma.storage.chartInfo[0].title).signif(6).col(function(d) { return d["Trt"]; }));
glimma.storage.chartData.push(glimma.transform.toRowMajor({"name":[1,2,3,4,5,6,7,8],"eigen":[0.43,0.18,0.12,0.09,0.07,0.04,0.04,0.02]}));
glimma.storage.chartInfo.push({"names":"name","y":"eigen","ndigits":[],"signif":6,"xlab":"Dimension","ylab":"Proportion","col":[],"anno":"eigen","height":300,"width":300,"type":"bar","title":"Variance Explained","flag":[],"info":{"dims":9}});
glimma.storage.charts.push(glimma.chart.barChart().height(300).width(300).id(function (d) { return d["name"]; }).xlab("Dimension").y(function (d) { return d["eigen"]; }).ylab("Proportion").title(glimma.storage.chartInfo[1].title).signif(6));
glimma.storage.tables.push(glimma.chart.table().data(glimma.storage.chartData[0]).columns(["label","Trt","Sample"]));
glimma.layout.addTable(glimma.layout.bsAddRow(d3.select(".container")));
glimma.storage.linkage = [{"from":2,"to":1,"src":"none","dest":"none","flag":"mds","info":"none"},{"from":1,"to":1,"src":"click","dest":"highlightById","flag":"tablink","info":"none"}];
glimma.storage.input = [];
