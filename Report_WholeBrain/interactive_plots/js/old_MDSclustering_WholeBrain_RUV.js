glimma.layout.setupGrid(d3.select(".container"), "md", [1,2]);
glimma.storage.chartData.push(glimma.transform.toRowMajor({"dim1":[-0.2775,-0.1024,-0.3488,-0.1134,0.01053,0.1576,0.1936,0.3066,0.004511,0.1694],"dim2":[-0.1074,-0.01842,0.1843,-0.2266,0.151,-0.2416,0.1464,-0.08772,-0.04862,0.2486],"dim3":[0.02292,-0.2261,0.2187,-0.0719,-0.2256,-0.0568,0.116,0.1966,0.1488,-0.1225],"dim4":[0.1577,-0.02027,-0.08778,0.02164,-0.2747,-0.03215,-0.0688,-0.06162,0.05042,0.3156],"dim5":[-0.05309,0.2022,0.0434,0.1234,-0.1508,-0.1378,0.08475,0.1491,-0.2458,-0.01533],"dim6":[0.007216,-0.008606,0.00113,0.0002632,0.003829,0.002813,-0.0009723,0.003192,-0.01075,0.001886],"dim7":[0.0007057,0.004487,0.002206,-0.007401,-0.0001659,0.002057,-0.007467,0.005266,-0.0002512,0.0005624],"dim8":[0.002504,0.0005312,-0.002074,-0.0009559,0.000851,-0.002335,0.0007902,0.0009375,0.0007396,-0.0009882],"label":["Veh_21WB","Veh_35WB","Veh_36WB","Veh_7WB","Flu_18WB","Flu_2WB","Flu_38WB","Flu_43WB","Flu_52WB","Flu_60WB"],"groups":["Veh","Veh","Veh","Veh","Flu","Flu","Flu","Flu","Flu","Flu"]}));
glimma.storage.chartInfo.push({"x":"dim1","y":"dim2","id":[],"ndigits":[],"signif":6,"pntsize":4,"xlab":"Dimension 1","ylab":"Dimension 2","xjitter":0,"yjitter":0,"xord":false,"yord":false,"xlog":false,"ylog":false,"xgrid":false,"ygrid":false,"xstep":false,"ystep":false,"col":"groups","cfixed":false,"anno":["label","groups","dim1","dim2"],"annoLabels":[],"height":400,"width":500,"type":"scatter","title":"MDS Plot","flag":[],"info":{"groupsNames":"groups"},"hide":false,"disableClick":false,"disableHover":false,"disableZoom":false});
glimma.storage.charts.push(glimma.chart.scatterChart().height(400).width(500).size(function (d) { return 4; }).x(function (d) { return d["dim1"]; }).xlab("Dimension 1").xJitter(0).y(function (d) { return d["dim2"]; }).ylab("Dimension 2").yJitter(0).tooltip(glimma.storage.chartInfo[0].anno).title(glimma.storage.chartInfo[0].title).signif(6).col(function(d) { return d["groups"]; }));
glimma.storage.chartData.push(glimma.transform.toRowMajor({"name":[1,2,3,4,5,6,7,8],"eigen":[0.3,0.2,0.19,0.16,0.14,0,0,0]}));
glimma.storage.chartInfo.push({"names":"name","y":"eigen","ndigits":[],"signif":6,"xlab":"Dimension","ylab":"Proportion","col":[],"anno":"eigen","height":300,"width":300,"type":"bar","title":"Variance Explained","flag":[],"info":{"dims":9}});
glimma.storage.charts.push(glimma.chart.barChart().height(300).width(300).id(function (d) { return d["name"]; }).xlab("Dimension").y(function (d) { return d["eigen"]; }).ylab("Proportion").title(glimma.storage.chartInfo[1].title).signif(6));
glimma.storage.tables.push(glimma.chart.table().data(glimma.storage.chartData[0]).columns(["label","groups"]));
glimma.layout.addTable(glimma.layout.bsAddRow(d3.select(".container")));
glimma.storage.linkage = [{"from":2,"to":1,"src":"none","dest":"none","flag":"mds","info":"none"},{"from":1,"to":1,"src":"click","dest":"highlightById","flag":"tablink","info":"none"}];
glimma.storage.input = [];
