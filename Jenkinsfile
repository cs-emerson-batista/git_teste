node('master'){
stage 'Checkout'
	deleteDir()
	checkout scm
	stage 'Build'
 	sh 'virtualenv venv; . venv/bin/activate; pip install -r requirements.txt --upgrade'
  step([$class: 'ArtifactArchiver', artifacts: 'build/'])
stage 'Run Tests'
	 try {
        sh 'virtualenv venv; . venv/bin/activate; python manage.py test'// do something that fails
        currentBuild.result = 'SUCCESS'
    } catch (Exception err) {
        currentBuild.result = 'FAILURE'
				echo err
    }
    echo "RESULT: ${currentBuild.result}"
}
