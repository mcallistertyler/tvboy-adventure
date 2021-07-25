pipeline {
	agent any

	stages {
		stage('Build game') {
			steps {
				wget -q "https://downloads.tuxfamily.org/godotengine/3.3.2/Godot_v3.3.2-stable_linux_headless.64.zip"
				unzip Godot_v3.3.2-stable_linux_headless.64.zip
				mv Godot_v3.3.2-stable_linux_headless.64.zip godot
				chmod +x godot
				file godot
				echo "got somewhere"
				if [ -d "builds" ]; then
					rm -rf builds
				fi
				mkdir builds
				mkdir builds/linux
				mkdir builds/windows
				
				set +e
			}

		}

	}
}
