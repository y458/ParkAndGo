<%-- 
    Document   : addGarage
    Created on : Mar 14, 2020, 3:07:40 PM
    Author     : dimit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Add New Garage</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <style>
            /* Always set the map height explicitly to define the size of the div
   * element that contains the map. */
            #map {
                height: 100%;
                margin: 40px;
                height: 700px;
            }

            /* Optional: Makes the sample page fill the window. */
            html,
            body {
                height: 100%;
                margin: 0;
                padding: 0;
            }

            #description {
                font-family: Roboto;
                font-size: 15px;
                font-weight: 300;
            }

            #infowindow-content .title {
                font-weight: bold;
            }

            #infowindow-content {
                display: none;
            }

            #map #infowindow-content {
                display: inline;
            }

            .pac-card {
                margin: 10px 10px 0 0;
                border-radius: 2px 0 0 2px;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                outline: none;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
                background-color: #fff;
                font-family: Roboto;
            }

            #pac-container {
                padding-bottom: 12px;
                margin-right: 12px;
            }

            .pac-controls {
                display: inline-block;
                padding: 5px 11px;
            }

            .pac-controls label {
                font-family: Roboto;
                font-size: 13px;
                font-weight: 300;
            }

            #pac-input {
                background-color: #fff;
                font-family: Roboto;
                font-size: 15px;
                font-weight: 300;
                margin-left: 12px;
                padding: 0 11px 0 13px;
                text-overflow: ellipsis;
                width: 400px;
            }

            #pac-input:focus {
                border-color: #4d90fe;
            }

            #title {
                color: #fff;
                background-color: #4d90fe;
                font-size: 25px;
                font-weight: 500;
                padding: 6px 12px;
            }

        </style>
    </head>

    <body>
        <div class="pac-card" id="pac-card">
            <div id="pac-container">
                <input id="pac-input" type="text" placeholder="Enter a location">
            </div>
        </div>
        <div id="map"></div>
        <div id="infowindow-content">
            <img src="" width="16" height="16" id="place-icon">
            <span id="place-name" class="title"></span><br>
            <span id="place-address"></span>
        </div>

        <input type="radio" id="spotType" name="spotType" value="single" checked>
        <label for="single">Single Spot Parking</label>
        <input type="radio" id="spotType" name="spotType" value="multi">
        <label for="multi">Multiple Spot Parking</label><br>

        <form action="/addGarage" method="POST"  enctype="multipart/form-data">
            <input type="text" id="coordinates" required="required" name="coordinates" hidden>
            <label for="address">Address: </label>
            <input type="text" required="required" id="address" name="address">
            <br/>
            <label for="comment">Comments: </label>
            <input type="text" id="comment" name="comment">
            <br/>
            <label for="entrancePic">Entrance Picture: </label>
            <input type="file" required="required" id="entrancePic" name="entrancePic">
                <br/>
                <label for="spotPic">Spot Picture: </label>
                <input type="file" required="required" id="spotPic" name="spotPic" disabled>
            <br/>
            <label for="billPhoto">Bill Photo: </label>
            <input type="file" required="required" id="billPhoto" name="billPhoto">
            <button id="click">
                click
            </button>
        </form>
        <script>
            // This example requires the Places library. Include the libraries=places
            // parameter when you first load the API. For example:
            // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

            var coolat;
            var coolon;
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: 37.9715323, lng: 23.7257492},
                    zoom: 13
                });
                var card = document.getElementById('pac-card');
                var input = document.getElementById('pac-input');
                var types = document.getElementById('type-selector');
                var strictBounds = document.getElementById('strict-bounds-selector');

                map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

                var autocomplete = new google.maps.places.Autocomplete(input);

                // Bind the map's bounds (viewport) property to the autocomplete object,
                // so that the autocomplete requests use the current map bounds for the
                // bounds option in the request.
                autocomplete.bindTo('bounds', map);

                // Set the data fields to return when the user selects a place.
                autocomplete.setFields(
                        ['address_components', 'geometry', 'icon', 'name']);

                var infowindow = new google.maps.InfoWindow();
                var infowindowContent = document.getElementById('infowindow-content');
                infowindow.setContent(infowindowContent);
                var marker = new google.maps.Marker({
                    map: map,
                    anchorPoint: new google.maps.Point(0, -29)

                });
                autocomplete.addListener('place_changed', function () {
                    infowindow.close();
                    marker.setVisible(false);
                    var place = autocomplete.getPlace();
                    if (!place.geometry) {
                        // User entered the name of a Place that was not suggested and
                        // pressed the Enter key, or the Place Details request failed.
                        window.alert("No details available for input: '" + place.name + "'");
                        return;
                    }

                    // If the place has a geometry, then present it on a map.
                    if (place.geometry.viewport) {
                        map.fitBounds(place.geometry.viewport);
                    } else {
                        map.setCenter(place.geometry.location);
                        map.setZoom(17);  // Why 17? Because it looks good.
                    }
                    marker.setPosition(place.geometry.location);
                    marker.setVisible(true);

                    //-------------------------------
                    $('#coordinates').val(marker.position);
                    $('#address').val($('#pac-input').val());
                    //-------------------------------


                    var address = '';
                    if (place.address_components) {
                        address = [
                            (place.address_components[0] && place.address_components[0].short_name || ''),
                            (place.address_components[1] && place.address_components[1].short_name || ''),
                            (place.address_components[2] && place.address_components[2].short_name || '')
                        ].join(' ');
                    }

                    infowindowContent.children['place-icon'].src = place.icon;
                    infowindowContent.children['place-name'].textContent = place.name;
                    infowindowContent.children['place-address'].textContent = address;
                    infowindow.open(map, marker);
                });

                // Sets a listener on a radio button to change the filter type on Places
                // Autocomplete.
                function setupClickListener(id, types) {
                    var radioButton = document.getElementById(id);
                    radioButton.addEventListener('click', function () {
                        autocomplete.setTypes(types);

                    });
                }
                $(document).ready(function () {
                    $('#click').on("click", function () {

                    });
                });
            }
        </script>
        <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2jIaoEKQV45vIJjLC6WYE_hH8c4SbTc8&callback=initMap&libraries=places">
    </script>

        <script type="text/javascript">
            $(document).ready((function () {
                $('button[type=submit]').click(function (e) {
                    e.preventDefault();
                    //Disable submit button. I dont want to submit the form
                    $(this).prop('disabled', true);
                    var form = document.forms[0];
                    var formData = new FormData(form);
                    var url;
                    if($("input[name='spotType']:checked").val()==="multi"){
                        url='/fileUploadMultiSpot';
                    }
                    if($("input[name='spotType']:checked").val()==="single"){
                        url='/fileUpload';
                    }
                    //alert(formData);
                    // Ajax call for file uploaling
                    var ajaxReq = $.ajax({
                        url: url,
                        type: 'POST',
                        data: formData,
                        //Type: Boolean
                        //If set to false, it will force requested pages not to be cached by the browser.
                        // Note: Setting cache to false will only work correctly with HEAD and GET requests.
                        // It works by appending "_={timestamp}" to the GET parameters.
                        // The parameter is not needed for other types of requests, except
                        // in IE8 when a POST is made to a URL that has already been requested by a GET.
                        //https://api.jquery.com/jquery.ajax/
                        cache: false,
                        contentType: false, // λεμε να μην βαλει content-type στο request
                        processData: false, // Να μην το κάνει string για να το στειλει http://api.jquery.com/jquery.ajax/
                        //Callback for creating the XMLHttpRequest object
                        xhr: function () {
                            // alert("create request")
                            //Get XmlHttpRequest object
                            var xhr = $.ajaxSettings.xhr();
                            //Set onprogress event handler
                            xhr.upload.onprogress = function (event) {
                                //  alert("sending")
                                var perc = Math.round((event.loaded / event.total) * 100);
                                $('#progressBar').text(perc + '%');
                                $('#progressBar').css('width', perc + '%');
                            };
                            return xhr;
                        }
                    });

                });
            }));
        </script>
        <script>
            //enable/disable for radio button of multispot garage
            $(document).ready(function () {
              $('input[type=radio][name=spotType]').change(function (){
                  var radioValue = $("input[name='spotType']:checked").val();
                  if(radioValue==="multi"){
                      $('#spotPic').removeAttr("disabled");
                  }else{
                      $('#spotPic').attr('disabled',"true");
                  }
              });  
            });
            
        </script>
        
    </body>

</html>