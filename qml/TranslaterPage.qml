import VPlayApps 1.0
import QtQuick 2.0
import VPlay 2.0

Page {

	AppText {
		id: text1
		anchors.horizontalCenter: parent.horizontalCenter
		width: 400
		horizontalAlignment: Text.AlignHCenter
		wrapMode: Text.WordWrap
		font.pixelSize: 18
	}

	AppButton {
		anchors.horizontalCenter: parent.horizontalCenter
		icon: IconType.check
		text: "Ready"
		id: appButton
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
			var http = new XMLHttpRequest()
			var url = "https://api.chucknorris.io/jokes/random"

			http.onreadystatechange = function () {
				if (http.readyState === XMLHttpRequest.DONE) {
					var responseJSON = JSON.parse(http.responseText)
					text1.text = responseJSON.value
				}
			}
			http.open("GET", url, true)
			http.send()
		}

		function postData() {

			var http = new XMLHttpRequest()
			var text = ""
			var url = "https://translate.yandex.net/api/v1.5/tr.json/translate?"
			var params = "key=trnsl.1.1.20181017T144415Z.2e31cc084f129683.c73821dab02a400d5b7cbc373e47622ef2e2425a&text=" + text + "&lang=ru"

			http.onreadystatechange = function () {
				if (http.readyState === XMLHttpRequest.DONE) {
					var responseJSON = JSON.parse(http.responseText)
					console.log(responseJSON.text)
				}
			}
			http.open("GET", url + params, true)
			http.send()
		}
	}
}
