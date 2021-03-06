. titanub/utils.sh
. titanub/checks.sh
. titanub/logbot/logbot.sh
trap handleSigTerm TERM
trap handleSigInt INT

initNaruto() {
    assertPrerequisites
    sendMessage "Initializing titan..."
    assertEnvironment
    editLastMessage "Starting Titan ..."
}

startNaruto() {
   python3 -m naruto
}

stopNaruto() {
    sendMessage "Exiting Titan ..."
    exit 0
}

handleSigTerm() {
    log "Exiting With SIGTERM (143) ..."
    stopNaruto
    exit 143
}

handleSigInt() {
    log "Exiting With SIGINT (130) ..."
    stopNaruto
    exit 130
}

runNaruto() {
    initNaruto
    startNaruto "$@"
    stopNaruto
}
