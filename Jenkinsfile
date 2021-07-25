pipeline {
	agent any

	stages {
		stage('Build game') {
			steps {
				sh "wget -q https://downloads.tuxfamily.org/godotengine/3.3.2/Godot_v3.3.2-stable_linux_headless.64.zip"
				sh "unzip -o Godot_v3.3.2-stable_linux_headless.64.zip"
				sh "mv Godot_v3.3.2-stable_linux_headless.64.zip godot"
				sh "chmod +x godot"
				sh "ls"
				sh '''echo got somewhere '''
				sh '''if [ -d "builds" ]; then
					rm -rf builds
				fi'''
				sh "mkdir builds"
				sh "mkdir builds/linux"
				sh "mkdir builds/windows"
				
				sh "set +e"
			}

		}

	}
}
