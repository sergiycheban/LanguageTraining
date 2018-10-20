import VPlayApps 1.0
import QtQuick 2.0

App {

	id: app
	Navigation {
		tabPosition: 8

		NavigationItem {
			id: main
			title: "Home"
			icon: IconType.home

			NavigationStack {

				MainPage {
					title: main.title
				}
			}
		}

		NavigationItem {
			id: translater
			title: "Phrases"
			icon: IconType.keyboardo

			NavigationStack {
				TranslaterPage {
					title: translater.title
				}
			}
		}

		NavigationItem {
			id: audio
			title: "Music"
			icon: IconType.music

			NavigationStack {
				AudioPage {
					title: audio.title
				}
			}
		}

		NavigationItem {
			id: account
			title: "Account"
			icon: IconType.user

			NavigationStack {
				AccountPage {
					title: account.title
				}
			}
		}
		NavigationItem {
			id: settings
			title: "Settings"
			icon: IconType.gear

			NavigationStack {
				Settings {
					title: settings.title
				}
			}
		}
	}
}
