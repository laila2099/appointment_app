allprojects {
    repositories {
        google()
        mavenCentral()
<<<<<<< HEAD
        
=======
>>>>>>> 54670a97018368bfc6e78e64e3e244cf8e964163
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
>>>>>>> 54670a97018368bfc6e78e64e3e244cf8e964163
