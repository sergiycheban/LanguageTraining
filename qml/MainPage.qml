import VPlayApps 1.0
import QtQuick 2.0

Page {

	Rectangle {
		color: "red"
		GridView {
			delegate: Rectangle {
				color: "transparent"
			}
		}
	}
}
