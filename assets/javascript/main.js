window['oncontextmenu'] = function() {
    return false
}
function audioPlay() {
    var VAR_audio_element = document['getElementById']('audio')
    VAR_audio_element['volume'] = 0.5
    VAR_audio_element['play']()
}

function videoPlay() {
    var VAR_video_element = document['getElementById']('video')
    VAR_video_element['play']()
}
$(document).keydown(function(ARG_keycode) {
    if (ARG_keycode['keyCode'] == 123) {
        return false
    } else {
        if (
            (ARG_keycode['ctrlKey'] &&
                ARG_keycode['shiftKey'] &&
                ARG_keycode['keyCode'] == 73) ||
            (ARG_keycode['ctrlKey'] &&
                ARG_keycode['shiftKey'] &&
                ARG_keycode['keyCode'] == 74)
        ) {
            return false
        }
    }
})
