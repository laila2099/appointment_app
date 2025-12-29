allprojects {
    repositories {
        google()
        mavenCentral()
<<<<<<< HEAD
        
=======
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
<<<<<<< HEAD
subprojects {
    configurations.all {
        resolutionStrategy {
            force("com.google.android.gms:play-services-maps:18.2.0")
        }
    }
}
=======
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
