glimma.layout.setupGrid(d3.select(".container"), "md", [1,2]);
glimma.storage.chartData.push(glimma.transform.toRowMajor({"dim1":[-0.4816,0.3304,0.2709,0.3075,-0.6737,-0.4442,-0.7928,1.165,0.3187],"dim2":[-0.8292,-0.04951,0.06952,-0.22,-0.000262,1.136,-0.1919,-0.01034,0.0953],"dim3":[0.6333,-0.07873,-0.06745,0.08461,-0.9664,0.4929,0.0378,-0.04195,-0.09412],"dim4":[-0.4913,0.3124,0.1365,0.0441,-0.4407,-0.227,0.7564,-0.1886,0.09803],"dim5":[-0.08732,0.02124,-0.5141,0.2277,0.07775,0.09134,0.2346,0.3729,-0.4242],"dim6":[0.1196,0.5924,-0.1943,-0.4653,0.01397,0.02389,-0.08082,0.01959,-0.02907],"dim7":[-0.03032,0.08609,-0.3944,0.2515,-0.01016,0.002169,-0.1036,-0.1948,0.3935],"dim8":[0.04294,-0.2823,-0.1489,-0.3309,-0.01348,-0.02562,0.1989,0.2541,0.3052],"label":["Veh_45M","Veh_46M","Veh_53M","Veh_8M","Flu_31M","Flu_42M","Flu_50M","Flu_51M","Flu_9M"],"Trt":["Veh","Veh","Veh","Veh","Flu","Flu","Flu","Flu","Flu"],"Sample":["45M","46M","53M","8M","31M","42M","50M","51M","9M"]}));
glimma.storage.chartInfo.push({"x":"dim1","y":"dim2","id":[],"ndigits":[],"signif":6,"pntsize":4,"xlab":"Dimension 1","ylab":"Dimension 2","xjitter":0,"yjitter":0,"xord":false,"yord":false,"xlog":false,"ylog":false,"xgrid":false,"ygrid":false,"xstep":false,"ystep":false,"col":"Trt","cfixed":false,"anno":["label","Trt","Sample","dim1","dim2"],"annoLabels":[],"height":400,"width":500,"type":"scatter","title":"MDS Plot","flag":[],"info":{"groupsNames":["Trt","Sample"]},"hide":false,"disableClick":false,"disableHover":false,"disableZoom":false});
glimma.storage.charts.push(glimma.chart.scatterChart().height(400).width(500).size(function (d) { return 4; }).x(function (d) { return d["dim1"]; }).xlab("Dimension 1").xJitter(0).y(function (d) { return d["dim2"]; }).ylab("Dimension 2").yJitter(0).tooltip(glimma.storage.chartInfo[0].anno).title(glimma.storage.chartInfo[0].title).signif(6).col(function(d) { return d["Trt"]; }));
glimma.storage.chartData.push(glimma.transform.toRowMajor({"name":[1,2,3,4,5,6,7,8],"eigen":[0.31,0.2,0.16,0.12,0.07,0.06,0.04,0.04]}));
glimma.storage.chartInfo.push({"names":"name","y":"eigen","ndigits":[],"signif":6,"xlab":"Dimension","ylab":"Proportion","col":[],"anno":"eigen","height":300,"width":300,"type":"bar","title":"Variance Explained","flag":[],"info":{"dims":8}});
glimma.storage.charts.push(glimma.chart.barChart().height(300).width(300).id(function (d) { return d["name"]; }).xlab("Dimension").y(function (d) { return d["eigen"]; }).ylab("Proportion").title(glimma.storage.chartInfo[1].title).signif(6));
glimma.storage.tables.push(glimma.chart.table().data(glimma.storage.chartData[0]).columns(["label","Trt","Sample"]));
glimma.layout.addTable(glimma.layout.bsAddRow(d3.select(".container")));
glimma.storage.linkage = [{"from":2,"to":1,"src":"none","dest":"none","flag":"mds","info":"none"},{"from":1,"to":1,"src":"click","dest":"highlightById","flag":"tablink","info":"none"}];
glimma.storage.input = [];