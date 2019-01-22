if (mouse_check_button(mb_left) || keyboard_check(vk_right) || keyboard_check(vk_left) || mouse_wheel_up() || mouse_wheel_down()) {
    global.popup = 0
    instance_destroy()
}
if (obj_controller.window != window) {
    global.popup = 0
    instance_destroy()
}

