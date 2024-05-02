package attestation.slsa1
import future.keywords.if

approved_repos := [
    "https://github.com/sigstore/sigstore-js",
    "https://github.com/foobar/fizzbuzz",
    "https://github.com/ejahnGithub/personal-test-05-01"
]

# Fail closed
default allow := false

# Allow if the repository is in the approved_repos list
allow {
    some i
    repo := input[i].verificationResult.statement.predicate.buildDefinition.externalParameters.workflow.repository
    
    repo == approved_repos[_]
}

