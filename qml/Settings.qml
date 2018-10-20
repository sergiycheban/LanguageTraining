import VPlayApps 1.0
import VPlay 2.0
import QtQuick 2.9

Page {
	Column {
		spacing: 40
		anchors.horizontalCenter: parent.horizontalCenter
		Row {
			id: row
			anchors.horizontalCenter: parent.horizontalCenter
			UserImage {
				id: userImage
				property string iconFontName: Theme.iconFont.name
				width: dp(90)
				height: width
				placeholderImage: "\uf007"
				source: app.settings.getValue("path")

				editable: true
				editBackgroundColor: Theme.tintColor

				property bool shownEditPhotoDialog: false

				onEditClicked: {
					if (system.desktopPlatform) {
						nativeUtils.displayImagePicker(qsTr("Choose Image"))
					} else {
						shownEditPhotoDialog = true
						nativeUtils.displayAlertSheet(
									"",
									["Choose Photo", "Take Photo", "Reset Photo"],
									true)
					}
				}

				Connections {
					target: nativeUtils
					onAlertSheetFinished: {
						if (userImage.shownEditPhotoDialog) {
							if (index == 0)
								nativeUtils.displayImagePicker(
											qsTr(
												"Choose Image")) // Choose image
							else if (index == 1)
								nativeUtils.displayCameraPicker(
											"Take Photo") // Take from Camera
							else if (index == 2)
								userImage.source = ""
							userImage.shownEditPhotoDialog = false
						}
					}

					onImagePickerFinished: {
						console.debug("Image picker", path)
						if (accepted) {
							userImage.source = Qt.resolvedUrl(path)
							app.settings.setValue("path", path)
						}
					}

					onCameraPickerFinished: {
						console.debug("Camera picker", path)
						if (accepted) {
							userImage.source = Qt.resolvedUrl(path)
							app.settings.setValue("path", path)
						}
					}
				}
			}
		}

		Row {
			id: tintColorRow
			anchors.horizontalCenter: parent.horizontalCenter
			spacing: parent.spacing
			property color defaultColor: Theme.isIos ? "#007aff" : (Theme.isAndroid ? "#3f51b5" : "#01a9e2") // default is v-play blue
			property int currentIndex: 0

			Connections {
				target: Theme
				onPlatformChanged: if (tintColorRow.currentIndex === 0)
									   Theme.colors.tintColor = tintColorRow.defaultColor
			}

			AppText {
				text: "Theme:"
				anchors.verticalCenter: parent.verticalCenter
			}

			Repeater {
				model: [tintColorRow.defaultColor, "#FF3B30", "#4CD964", "#FF9500"]

				Rectangle {
					color: modelData
					width: dp(30)
					height: dp(30)
					MouseArea {
						anchors.fill: parent
						onClicked: {
							Theme.colors.tintColor = color
							tintColorRow.currentIndex = index
						}
					}
				}
			}
		}
	}
}
