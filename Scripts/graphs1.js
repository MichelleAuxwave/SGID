        var 
            COLOR_FONT = 'rgba( 255, 255, 255, 1 )',
            COLOR_BORD = 'rgba( 127, 127, 127, 1 )',
        
            COLOR_1A_0 = 'rgba( 40, 170, 240, 0.2 )',
            COLOR_1A_1 = 'rgba( 40, 170, 240, 1 )',
            
            COLOR_1B_0 = 'rgba( 255, 40, 40, 0.2 )',
            COLOR_1B_1 = 'rgba( 255, 40, 40, 1 )',
        
            COLOR_2A_0 = 'rgba( 240, 100, 40, 0.2 )',
            COLOR_2A_1 = 'rgba( 240, 100, 40, 1 )'
        ;
        

function dashboardGraphic_1(el){
            var ctx = document.getElementById(el).getContext('2d');
            var chrt = new Chart(ctx, {
                type: 'pie',
                data: {
                    datasets: [{
                        data: [60, 40],
                        backgroundColor: [ COLOR_1A_0, COLOR_1B_0 ],
                        borderColor: [ COLOR_1A_1, COLOR_1B_1 ],
                        borderWidth: 1
                    }], labels: ["Valor A", "Valor B"]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: { position: 'bottom', labels: { fontColor: COLOR_FONT, fontSize: 12 } },
                    title: {
                        display: true,
                        text: "GRFICA A DEFINIR",
                        fontColor: COLOR_FONT,
                        fontSize: 12
                    },
                    animation: { animateScale: true, animateRotate: true }
                }
            });
        }
        
        function dashboardGraphic_2(el){
            var ctx = document.getElementById(el).getContext('2d');
            var chrt = new Chart(ctx, {
                type: 'pie',
                data: {
                    datasets: [{
                        data: [60, 40],
                        backgroundColor: [ COLOR_1A_0, COLOR_1B_0 ],
                        borderColor: [ COLOR_1A_1, COLOR_1B_1 ],
                        borderWidth: 1
                    }], labels: ["Valor A", "Valor B"]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: { position: 'bottom', labels: { fontColor: COLOR_FONT, fontSize: 12 } },
                    title: {
                        display: true,
                        text: "GRÁFICA A DEFINIR",
                        fontColor: COLOR_FONT,
                        fontSize: 12
                    },
                    animation: { animateScale: true, animateRotate: true }
                }
            });
        } 
        
        function dashboardGraphic_3(el){
            var ctx = document.getElementById(el).getContext('2d');
            var chrt = new Chart(ctx, {
                type: 'pie',
                data: {
                    datasets: [{
                        data: [60, 40],
                        backgroundColor: [ COLOR_1A_0, COLOR_1B_0 ],
                        borderColor: [ COLOR_1A_1, COLOR_1B_1 ],
                        borderWidth: 1
                    }], labels: ["Valor A", "Valor B"]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: { position: 'bottom', labels: { fontColor: COLOR_FONT, fontSize: 12 } },
                    title: {
                        display: true,
                        text: "GRÁFICA A DEFINIR",
                        fontColor: COLOR_FONT,
                        fontSize: 12
                    },
                    animation: { animateScale: true, animateRotate: true }
                }
            });
        } 
        
        function dashboardGraphic_4(el){
            var ctx = document.getElementById(el).getContext('2d');
            var chrt = new Chart(ctx, {
                type: 'pie',
                data: {
                    datasets: [{
                        data: [60, 40],
                        backgroundColor: [ COLOR_1A_0, COLOR_1B_0 ],
                        borderColor: [ COLOR_1A_1, COLOR_1B_1 ],
                        borderWidth: 1
                    }], labels: ["Valor A", "Valor B"]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: { position: 'bottom', labels: { fontColor: COLOR_FONT, fontSize: 12 } },
                    title: {
                        display: true,
                        text: "GRÁFICA A DEFINIR",
                        fontColor: COLOR_FONT,
                        fontSize: 12
                    },
                    animation: { animateScale: true, animateRotate: true }
                }
            });
        } 
        
        function dashboardGraphic_5(el){
            var ctx = document.getElementById(el).getContext('2d');
            var chrt = new Chart(ctx, {
                type: 'line',
                data: {
                    datasets: [{
                        label: 'Estadistica',
                        fill: false,
                        data: [60, 40, 25, 80],
                        backgroundColor: COLOR_2A_0,
                        borderColor: COLOR_2A_1,
                        borderWidth: 2
                    }], labels: ["Valor A", "Valor B", "Valor C", "Valor D"]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: { position: 'bottom', labels: { fontColor: COLOR_FONT, fontSize: 12 } },
                    title: {
                        display: true,
                        text: "GRÁFICA A DEFINIR",
                        fontColor: COLOR_FONT,
                        fontSize: 12
                    },
                    animation: { animateScale: true, animateRotate: true },
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'PARAMETROS'
                            }
                        }],
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'PORCENTAJES'
                            }
                        }]
                    }
                }
            });
        } 