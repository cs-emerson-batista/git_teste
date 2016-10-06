
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
				input message: 'Algo com sucesso?'
        currentBuild.result = 'SUCCESS'
    } catch (Exception err) {
        currentBuild.result = 'FAILURE'
				echo err
    }
    echo "RESULT: ${currentBuild.result}"

}
