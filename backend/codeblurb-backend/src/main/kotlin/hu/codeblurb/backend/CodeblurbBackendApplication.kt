package hu.codeblurb.backend

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class CodeblurbBackendApplication

fun main(args: Array<String>) {
	runApplication<CodeblurbBackendApplication>(*args)
}
