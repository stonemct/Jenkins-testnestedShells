#!`which env` groovy

// DEFAULTS

List LL = []
def TT = ''

properties([
    parameters([
        [$class: 'CascadeChoiceParameter',
         choiceType: 'PT_CHECKBOX',
         description: 'Select Environment',
         filterLength: 1,
         filterable: false,
         name: 'Environment',
         script: [
             $class: 'GroovyScript',
             script: [
                 classpath: [],
//                 sandbox: false,
                 sandbox: true,
                 script:
                     'return[\'Development\',\'QA\',\'Staging\',\'Production\']'
             ]
         ]
        ],
        string(
            defaultValue: '',
            description: 'test empty value for IF in bash subscript',
            name: 'bashif'
        ),
        booleanParam(
            defaultValue: false,
            description: 'If this box checked, the parameters will be updated from Jenkinsfile\'s from VCS  ',
            name: 'UParameters'
        )
    ])
])

if (params.UParameters) {
    println "The UParameters is flagged. This job is now ready to execute with the updated parameters"
    currentBuild.result = 'SUCCESS'
    return
}


node() {

    if ( env.Environment.isEmpty() ) {
        echo "Environment not specified."
        autoCancelled = true
//        error('Aborting the build.')
        LL = [ 's1', 's2', 's3' ]
    }
    else {
        echo "Environment total: ${env.Environment}"
        String[] Env_Array = params.Environment.split(',')
        for (x in Env_Array) {
            echo "ENV: ${x}"
        }
        LL = params.Environment.split(',')
    }

    TT = LL.last()

    println 'LL: ' + LL
    println 'TT: ' + TT

    println 'LL.each { loopoflist(it) }'
    LL.each { loopoflist(it) }

    println 'LL.reverse().each { loopoflist(it) }'
    LL.reverse().each { loopoflist(it) }

/*
    println 'LL.each.reverse()'
    LL.each.reverse() { loopoflist(it) }

    println 'LL.reverseEach { loopoflist(it) }'
    LL.reverseEach { loopoflist(it) }
*/

    stage ('checkout'){
        git credentialsId: 'petr_kuznetsov', url: 'git@github.com:stonemct/Jenkins-testnestedShells.git'
    }

env.eTT = TT
env.eLL = LL

    stage('run shell'){
        sh """
            ls -la
            
            
            echo 'LL: ' + ${LL}
            echo 'TT: ' + ${TT}  
          
            echo 'eLL: ' + ${eLL}
            echo 'eTT: ' + ${eTT}
            
 #           export LL
 #           export TT

#            export eLL
#            export eTT

            
            bash test.sh

        """
    }

}

def loopoflist(def ITT) {
    """
This function needs for reuse print and stage phase
input: name of stage
output: none
"""
    println ITT
    stage(ITT)
        {
            println ITT
        }
}
