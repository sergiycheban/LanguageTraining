import VPlayApps 1.0
import QtQuick 2.0
import VPlay 2.0

Page {

	SearchBar {
		id: weatherSearchBar
		focus: true
		placeHolderText: qsTr("Enter city name")
		onAccepted: loadJsonData()
	}

	AppText {
		id: text1
		anchors.centerIn: parent
		width: 303
		height: 72
		text: qsTr("Text")
		anchors.verticalCenterOffset: 150
		anchors.horizontalCenterOffset: 1
		horizontalAlignment: Text.AlignLeft
		wrapMode: Text.WordWrap
		font.pixelSize: 18
	}

	AppButton {
		anchors.top: parent
		icon: IconType.android
		id: appButton
		x: 144
		y: 385
		width: 142
		height: 31
		anchors.bottom: parent.bottom
		anchors.bottomMargin: 64
		onClicked: {
			getText.getData()
			getText.postData()
		}
	}

	Item {
		id: getText

		function getData() {
			var xmlhttp = new XMLHttpRequest()
			var url = "https://api.chucknorris.io/jokes/random"

			xmlhttp.open("GET", url, true)
			xmlhttp.send()

			xmlhttp.onreadystatechange = function () {
				if (xmlhttp.readyState === XMLHttpRequest.DONE) {
					var responseJSON = JSON.parse(xmlhttp.responseText)
					text1.text = responseJSON.value
				}
			}
		}

		function postData() {

			var http = new XMLHttpRequest()
			var url = "http://localhost:8080"
			var params = "key=trnsl.1.1.20181017T144415Z.2e31cc084f129683.c73821dab02a400d5b7cbc373e47622ef2e2425a&text=Hi how are you&lang=en-ru&callback=callback()"
			http.open("POST", url, true)
			http.send(params)

			http.onreadystatechange = function () {
				var responseJSON = JSON.parse(xmlhttp.responseText)
				console.log(responseJSON.text)
			}
		}
		function callback() {
			var responseJSON = JSON.parse(xmlhttp.responseText)
			console.log("sdfsdfasffd" + responseJSON.text)
		}
	}
}
