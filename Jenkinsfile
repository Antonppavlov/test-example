pipeline {
    agent any
    tools {
        maven 'maven'
        allure 'allure'
    }
    stages {
        stage('clone repository') {
            steps {
                deleteDir()
                git branch: 'master', credentialsId: 'gitlab_new', url: 'https://github.com/Antonppavlov/test-example.git'
            }
        }
        stage('run tests') {
            steps {
                sh "mvn test allure:aggregate -Dbranch='${branch}' -Dproperties=odd_epam.properties -Dsurefire.rerunFailingTestsCount=1 -DthreadCount='${threadCount}' -Dmaven.repo.local=repository -Dselenide.timeout=25000 -Dselenide.remote=http://10.66.220.78:4444/wd/hub -DbaseURI='${baseURI}' \"-Dcucumber.options=--tags '${tags}' --plugin io.qameta.allure.cucumber4jvm.AllureCucumber4Jvm\""
            }
        }
        stage('generate allure report') {
            steps {
                allure includeProperties: false, jdk: '', results: [[path: 'target/allure-results']]
            }
        }
    }

    post{
        success {
            script {
                emailext  body: '${SCRIPT, template="allure-report2.groovy"}', subject: "Втб-Онлайн. Запуск тестов. ${BUILD_URL}", to: "${email}"
            }
        }
        unstable{
            script{
                emailext  body: '${SCRIPT, template="allure-report2.groovy"}', subject: "Втб-Онлайн. Запуск тестов. ${BUILD_URL}", to: "${email}"
            }
        }
        failure{
            script{
                emailext  body: '${SCRIPT, template="allure-report2.groovy"}', subject: "Втб-Онлайн. Запуск тестов. ${BUILD_URL}", to: "${email}"
            }
        }
    }
}