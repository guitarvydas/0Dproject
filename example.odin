package project

import "core:os"
import "core:fmt"

import zd "0d/odin/0d"
import "0d/odin/std"

main :: proc() {
    main_container_name, diagram_names := std.parse_command_line_args ()
    palette := std.initialize_component_palette (diagram_names, components_to_include_in_project)
    std.run (&palette, main_container_name, diagram_names, start_function)
}

start_function :: proc (main_container : ^zd.Eh) {
    x := zd.new_datum_bang ()
    msg := zd.make_message("input", x, zd.make_cause (main_container, nil) )
    main_container.handler(main_container, msg)
}


components_to_include_in_project :: proc (leaves: ^[dynamic]zd.Leaf_Template) {
    zd.append_leaf (leaves, std.string_constant ("ABC"))
    zd.append_leaf (leaves, std.string_constant ("demo/demo_abcjs/abc.ohm"))
    zd.append_leaf (leaves, std.string_constant ("demo/demo_abcjs/abcjs.rwr"))
    zd.append_leaf (leaves, std.string_constant ("demo/demo_abcjs/null.js"))
}


start_function :: proc (main_container : ^zd.Eh) {
    filename := zd.new_datum_string ("demo/demo_abcjs/test.abc")
    x := zd.new_datum_bang ()
    byte_array := zd.new_datum_bytes ([]byte{1,2,3})
    h := zd.new_datum_handle (os.Handle{os.stderr})
    msg := zd.make_message("input", filename, zd.make_cause (main_container, nil) )
    main_container.handler(main_container, msg)
}


