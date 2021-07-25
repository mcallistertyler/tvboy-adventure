pipeline {
	agent any

	stages {
		stage('Build game') {
			steps {
				sh "rm *.tpz*"
				sh "rm *.zip*"
				sh "rm * git_api.gdn"
				sh "rm -rf addons"
				sh "wget -q https://downloads.tuxfamily.org/godotengine/3.3.2/Godot_v3.3.2-stable_linux_headless.64.zip"
				sh "unzip -o Godot_v3.3.2-stable_linux_headless.64.zip"
				sh "mv Godot_v3.3.2-stable_linux_headless.64 godot"
				sh "chmod +x godot"
				sh '''if [ -d "builds" ]; then
					rm -rf builds
				fi'''
				sh "mkdir builds"
				sh "mkdir builds/linux"
				sh "mkdir builds/windows"
				sh "wget -q https://downloads.tuxfamily.org/godotengine/3.3.2/Godot_v3.3.2-stable_export_templates.tpz"				
				sh "mkdir -p ~/.local/share/godot/templates"
				sh "unzip -o Godot_v3.3.2-stable_export_templates.tpz -d ~/.local/share/godot/templates" 
				sh "rm -rf ~/.local/share/godot/templates/3.3.2.stable"
				sh "mv ~/.local/share/godot/templates/templates ~/.local/share/godot/templates/3.3.2.stable"
				sh "set +e"
				sh "uname -m"
				sh '''./godot --export \\"Linux/X11\\" project.godot builds/linux '''
				sh "ls builds/linux"
			}

		}

	}
}
