import VPlayApps 1.0
import QtQuick 2.0
import QtMultimedia 5.9

Page {

	title: "Audio"

	Column {
		anchors.centerIn: parent
		AppButton {
			anchors.horizontalCenter: parent.horizontalCenter
			text: "Play Audio"
			onClicked: {
				audio.play()
			}
		}
	}

	Audio {
		id: audio
		source: "https://v-play.net/web-assets/beep.mp3"
	}
}
