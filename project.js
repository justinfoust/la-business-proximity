var mapbox = {
    apiURL: "https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}",
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    street: "mapbox.streets",
    light: "mapbox.light",
    dark: "mapbox.dark",
    outdoors: "mapbox.outdoors",
    satellite: "mapbox.satellite"
};

var baseMaps = {

    "Street Map": L.tileLayer(mapbox.apiURL, {
        attribution: mapbox.attribution,
        id: mapbox.street,
        accessToken: API_KEY
    }),
    "Outdoor Map": L.tileLayer(mapbox.apiURL, {
        attribution: mapbox.attribution,
        id: mapbox.outdoors,
        accessToken: API_KEY
    }),
    "Light Map": L.tileLayer(mapbox.apiURL, {
        attribution: mapbox.attribution,
        id: mapbox.light,
        accessToken: API_KEY
    }),
    "Dark Map": L.tileLayer(mapbox.apiURL, {
        attribution: mapbox.attribution,
        id: mapbox.dark,
        accessToken: API_KEY
    }),
    "Satellite Map": L.tileLayer(mapbox.apiURL, {
        attribution: mapbox.attribution,
        id: mapbox.satellite,
        accessToken: API_KEY
    })
};

var icons = {

    "STARBUCKS CORPORATION": L.icon({
        iconUrl: "pic/Starbucks_Corporation_Logo_2011.svg",
        iconSize: [30,87]
    }),
    "ABM INDUSTRY GROUPS, LLC": L.icon({
        iconUrl: "pic/ABM.svg",
        iconSize: [30,87]
    }),
    "COINSTAR ASSET HOLDINGS, LLC": L.icon({
        iconUrl: "pic/coinstar.svg",
        iconSize: [30,87]
    }),
    "GARFIELD BEACH CVS LLC": L.icon({
        iconUrl: "pic/cvs .svg",
        iconSize: [30,87]
    }),
    "KEYME LLC": L.icon({
        iconUrl: "pic/keyme.svg",
        iconSize: [30,87]
    }),
    "LAZ KARP ASSOCIATES LLC": L.icon({
        iconUrl: "pic/laz-.svg",
        iconSize: [30,87]
    }),
    "REDBOX AUTOMATED RETAIL LLC": L.icon({
        iconUrl: "pic/redbox.svg",
        iconSize: [30,87]
    }),
    "T MOBILE WEST LLC": L.icon({
        iconUrl: "pic/t-mobile.svg",
        iconSize: [30,87]
    }),
    "UNITED VALET PARKING INC": L.icon({
        iconUrl: "pic/united_valet_parking.svg",
        iconSize: [30,87]
    }),
    "VOLUNTEERS OF AMERICA OF LOS ANGELES": L.icon({
        iconUrl: "pic/volunteers-of-america.svg",
        iconSize: [30,87]
    })
}

// ======================================modified===========================================
var myMap = L.map("map", {
    center: [34.0522, -118.2437],
    zoom: 10
    //    layers: [baseMaps["Dark Map"]]
});

baseMaps["Outdoor Map"].addTo(myMap)

// addon
var geo_link = "data/la-county-neighborhoods-v6.geojson";
var neighbor_link = "data/Income_LA_Allison.csv";

d3.csv(neighbor_link).then(data => {
    // console.log(data)
    createLayer(data);
});

function getColor(d) {
    return d > 200000 ? 'lightgreen' :
    d > 150000 ? 'green' :
    d > 100000 ? 'yellow' :
    d > 50000 ? 'orange' :
    'red';
};

function style(s) {
    return {
        fillColor: getColor(s),
        weight: 2,
        opacity: 1,
        color: 'white',
        dashArray: '3',
        fillOpacity: 0.7
    }
};

function formatNumber(num) {
    return parseInt(num).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
};

function createLayer(income) {
    d3.json(geo_link).then(data => {
        var features = data.features;
        for (i=0; i< income.length; i++) {
            var district = features.filter(d=>d.properties.name == income[i].Neighborhood);
            var name = income[i].Neighborhood;
            var avg_color = income[i].AVG;
            // var med_color = income[i].MEDIAN;
            // var total_color = income[i].Total;

            L.geoJson(district, {
                style: style(avg_color)
            })
                .addTo(myMap)
                .bindPopup(`<h4>County: ${name}</h4><hr>
<h4>Total income: $${formatNumber(income[i].Total)}</h4>
<h4>Average Income: $${formatNumber(income[i].AVG)}</h4>
<h4>Median Income: $${formatNumber(income[i].MEDIAN)}</h4>`
                          );
        };
    });
};



var iconLayer = L.markerClusterGroup();
myMap.addLayer(iconLayer);


var legend = L.control({position: "bottomright"});

legend.onAdd = function () {
   var div = L.DomUtil.create("div", "legend");
   var labels = ["0-50k","50k-100k","100k-150k","150k-200k","200k+"];
   var colors=["lightgreen","green","yellow","orange","red"]

   for (var i = 0; i < colors.length; i++) {
       div.innerHTML += '<i style="background:' + colors[i] + '"></i>' + labels[i] + '<br>';
   }
   return div;
};

legend.addTo(myMap);







d3.json("data/top10_proximity_data.json").then(data => {
    console.log(data);    


    var top10BusNames = data.map(d => d.top10_business);
    console.log(top10BusNames);

    top10BusNames.map(d => {
        d3.select("#top10-select")
            .append("option")
            .classed("dropdown-option", true)
            .attr("value", d)
            .text(`${d}`)

    })

    function binSort(obj, sliceNum = 10) {

        var objSorted = {};

        var keySorted = Object.keys(obj).sort((a,b) => -(obj[a] - obj[b])).slice(0,sliceNum);

        keySorted.map(k => {objSorted[k] = obj[k]});

        return objSorted;
    }

    function histBin(business, numTypes) {

        var naicsBin = {};

        data.forEach(bus => {
            if (bus.top10_business == business) {
                bus.top10_results.map(busResult => {
                    busResult.proximate.map(busProx => {

                        if (busProx.naics_description in naicsBin) {

                            naicsBin[busProx.naics_description] += 1

                        } else if (busProx.naics_description != null) {

                            naicsBin[busProx.naics_description] = 1
                        }
                    })
                })
            }
        })

        //        var foobar = binSort(naicsBin);
        //        console.log(foobar);
        return binSort(naicsBin, numTypes);
    }

    function histCityBin(business, numTypes) {

        var cityBin = {};

        data.forEach(bus => {
            if (bus.top10_business == business) {
                bus.top10_results.map(busResult => {
                    busResult.proximate.map(busProx => {

                        if (busProx.city in cityBin) {

                            cityBin[busProx.city] += 1

                        } else if (busProx.city != null) {

                            cityBin[busProx.city] = 1
                        }
                    })
                })
            }
        })

        return binSort(cityBin, numTypes);
    }

    function updateChart() {

        d3.select("#hist-d3").html("");

        var busName = d3.select("#top10-select").property("value")

        console.log(busName)


        var histData = histBin(busName, 10);
        console.log(Object.keys(histData), Object.values(histData));

        var histLabels = Object.keys(histData);
        var histValues = Object.values(histData);

        var totalCount = 0
        histValues.map(d => totalCount += d)

        console.log(totalCount)


        var svgWidth = 1330;
        var svgHeight = 0.33 * svgWidth;

        var chartMargin = {
            top: 60,
            right: 30,
            bottom: 30,
            left: 30
        };

        var chartWidth = svgWidth - chartMargin.left - chartMargin.right;
        var chartHeight = svgHeight - chartMargin.top - chartMargin.bottom;

        var svg = d3
        .select("#hist-d3")
        .append("svg")
        .attr("height", svgHeight)
        .attr("width", svgWidth);

        var chartGroup = svg
        .append("g")
        .attr("transform", `translate(${chartMargin.left}, ${chartMargin.top})`);

        var xLinearScale = d3.scaleLinear()
        .domain([d3.max(histValues, d => d), 0])
        .range([chartWidth, 0]);

        var yBandScale = d3.scaleBand()
        .domain(histLabels)
        .range([chartHeight, 0])
        .padding(0.1);

        var bottomAxis = d3.axisBottom(xLinearScale);
        var leftAxis = d3.axisLeft(yBandScale);

        chartGroup.append("g")
            .attr("transform", `translate(${chartMargin.left}, ${chartHeight})`)
            .classed("axis", true)
            .call(bottomAxis);

        chartGroup.append("text")
            .classed("title-label", true)
            .attr("transform", `translate(${chartWidth / 2}, ${-20})`)
            .attr("text-anchor", "middle")
            .text(`Types of Businesses Within 1/2 Mile of All ${busName} Locations`)

        var barSpacing = 10;
        var scaleY = 3;

        var barHeight = (chartHeight - (barSpacing * (histValues.length - 1))) / histValues.length;

        chartGroup.selectAll(".bar")
            .data(histValues)
            .enter()
            .append("rect")
            .classed("bar", true)
            .attr("height", d => barHeight)
            .attr("width", d => d * scaleY)
            .attr("y", (d, i) => i * (barHeight + barSpacing))
            .attr("x", chartMargin.left)
            .attr("rx", 3)
            .attr("ry", 3);

        chartGroup.selectAll(".axisLabels")
            .data(Object.entries(histData))
            .enter()
        //    .classed("axis-labels", true)
            .append("text")
            .attr("data-attr", "labels")
            .text(d => `${(d[1] / totalCount * 100).toFixed(1)}% - ` + d[0])
            .attr("x", chartMargin.left + 15)
            .attr("y", (d, i) => i * (barHeight + barSpacing) + (barHeight * 0.75))
            .attr("style", `font-size: ${barHeight * 0.75}`);

        chartGroup.append("text")
            .classed("axis-label", true)
            .attr("transform", `translate(${chartWidth / 2}, ${chartHeight + chartMargin.bottom})`)
            .attr("text-anchor", "middle")
            .text("Count")


        iconLayer.clearLayers();

        data.map(bus => {
            if (bus.top10_business == busName) {
                bus.top10_results.map(busResult => {
                    var busOri = busResult.origin

                    var newMarker = L.marker([busOri.lat, busOri.lon], {
                        icon: icons[busName]
                    });

                    newMarker.addTo(iconLayer)

                    newMarker.bindPopup(busOri.city + "<br>" + busOri.address)

                })
            }
        })

        var foo = Object.keys(histCityBin(busName))
        
        var metaName = busName;
        var metaLoc = totalCount;
        var metaTop = histLabels.slice(0,1);
        var metaCity = foo.slice(0,1);

        d3.select("#meta-name").text(metaName);
        d3.select("#meta-loc").text(metaLoc);
        d3.select("#meta-top").text(metaTop);
        d3.select("#meta-city").text(metaCity);

        console.log(metaName, metaLoc, metaTop, metaCity);
    }

    updateChart();

    d3.select("#top10-select").on("change", updateChart);

    var foo = histBin('ABM INDUSTRY GROUPS, LLC',3)



    });


