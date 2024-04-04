// ripped these numbers straight from source

function onCameraMove(e) {
    switch SONG.meta.name {
        case "improbable-outset":
            e.position.x = [563, 1149.5][curCameraTarget];
            e.position.y = [453, 367.5][curCameraTarget];
        case "madness":
            e.position.x = [582.5, 1149.5][curCameraTarget];
            e.position.y = [342.5, 367.5][curCameraTarget];
        case "hellclown":
            e.position.x = [-175.5, 857.5][curCameraTarget];
            e.position.y = [-278, 331.5][curCameraTarget];
        case "expurgation":
            e.position.x = [521.5, 1239.5][curCameraTarget];
            e.position.y = [92, 207.5][curCameraTarget];
    }
}