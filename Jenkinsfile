
stage 'Checkout'
	node('master'){
	deleteDir()
	checkout scm
}
stage 'Build'
	node('master'){

 	sh 'virtualenv venv; . venv/bin/activate; pip install -r requirements.txt --upgrade'
  step([$class: 'ArtifactArchiver', artifacts: 'build/'])
}
stage 'Run Tests'
	node('master'){


	 try {
        sh 'virtualenv venv; . venv/bin/activate; python manage.py test'// do something that fails
        sh "exit 1"
        currentBuild.result = 'SUCCESS'
    } catch (Exception err) {
        currentBuild.result = 'FAILURE'
    }
    echo "RESULT: ${currentBuild.result}"

}
