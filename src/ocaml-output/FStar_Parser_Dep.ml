open Prims
type verify_mode =
  | VerifyAll 
  | VerifyUserList 
  | VerifyFigureItOut 
let (uu___is_VerifyAll : verify_mode -> Prims.bool) =
  fun projectee  ->
    match projectee with | VerifyAll  -> true | uu____9 -> false
  
let (uu___is_VerifyUserList : verify_mode -> Prims.bool) =
  fun projectee  ->
    match projectee with | VerifyUserList  -> true | uu____20 -> false
  
let (uu___is_VerifyFigureItOut : verify_mode -> Prims.bool) =
  fun projectee  ->
    match projectee with | VerifyFigureItOut  -> true | uu____31 -> false
  
type files_for_module_name =
  (Prims.string FStar_Pervasives_Native.option * Prims.string
    FStar_Pervasives_Native.option) FStar_Util.smap
type color =
  | White 
  | Gray 
  | Black 
let (uu___is_White : color -> Prims.bool) =
  fun projectee  -> match projectee with | White  -> true | uu____54 -> false 
let (uu___is_Gray : color -> Prims.bool) =
  fun projectee  -> match projectee with | Gray  -> true | uu____65 -> false 
let (uu___is_Black : color -> Prims.bool) =
  fun projectee  -> match projectee with | Black  -> true | uu____76 -> false 
type open_kind =
  | Open_module 
  | Open_namespace 
let (uu___is_Open_module : open_kind -> Prims.bool) =
  fun projectee  ->
    match projectee with | Open_module  -> true | uu____87 -> false
  
let (uu___is_Open_namespace : open_kind -> Prims.bool) =
  fun projectee  ->
    match projectee with | Open_namespace  -> true | uu____98 -> false
  
let (check_and_strip_suffix :
  Prims.string -> Prims.string FStar_Pervasives_Native.option) =
  fun f  ->
    let suffixes = [".fsti"; ".fst"; ".fsi"; ".fs"]  in
    let matches =
      FStar_List.map
        (fun ext  ->
           let lext = FStar_String.length ext  in
           let l = FStar_String.length f  in
           let uu____146 =
             (l > lext) &&
               (let uu____159 = FStar_String.substring f (l - lext) lext  in
                uu____159 = ext)
              in
           if uu____146
           then
             let uu____180 =
               FStar_String.substring f (Prims.parse_int "0") (l - lext)  in
             FStar_Pervasives_Native.Some uu____180
           else FStar_Pervasives_Native.None) suffixes
       in
    let uu____197 = FStar_List.filter FStar_Util.is_some matches  in
    match uu____197 with
    | (FStar_Pervasives_Native.Some m)::uu____211 ->
        FStar_Pervasives_Native.Some m
    | uu____223 -> FStar_Pervasives_Native.None
  
let (is_interface : Prims.string -> Prims.bool) =
  fun f  ->
    let uu____240 =
      FStar_String.get f ((FStar_String.length f) - (Prims.parse_int "1"))
       in
    uu____240 = 105
  
let (is_implementation : Prims.string -> Prims.bool) =
  fun f  -> let uu____254 = is_interface f  in Prims.op_Negation uu____254 
let list_of_option :
  'Auu____261 .
    'Auu____261 FStar_Pervasives_Native.option -> 'Auu____261 Prims.list
  =
  fun uu___116_270  ->
    match uu___116_270 with
    | FStar_Pervasives_Native.Some x -> [x]
    | FStar_Pervasives_Native.None  -> []
  
let list_of_pair :
  'Auu____279 .
    ('Auu____279 FStar_Pervasives_Native.option * 'Auu____279
      FStar_Pervasives_Native.option) -> 'Auu____279 Prims.list
  =
  fun uu____294  ->
    match uu____294 with
    | (intf,impl) ->
        FStar_List.append (list_of_option intf) (list_of_option impl)
  
let (module_name_of_file : Prims.string -> Prims.string) =
  fun f  ->
    let uu____322 =
      let uu____326 = FStar_Util.basename f  in
      check_and_strip_suffix uu____326  in
    match uu____322 with
    | FStar_Pervasives_Native.Some longname -> longname
    | FStar_Pervasives_Native.None  ->
        let uu____333 =
          let uu____339 = FStar_Util.format1 "not a valid FStar file: %s" f
             in
          (FStar_Errors.Fatal_NotValidFStarFile, uu____339)  in
        FStar_Errors.raise_err uu____333
  
let (lowercase_module_name : Prims.string -> Prims.string) =
  fun f  ->
    let uu____353 = module_name_of_file f  in
    FStar_String.lowercase uu____353
  
let (namespace_of_module :
  Prims.string -> FStar_Ident.lident FStar_Pervasives_Native.option) =
  fun f  ->
    let lid =
      let uu____366 = FStar_Ident.path_of_text f  in
      FStar_Ident.lid_of_path uu____366 FStar_Range.dummyRange  in
    match lid.FStar_Ident.ns with
    | [] -> FStar_Pervasives_Native.None
    | uu____369 ->
        let uu____372 = FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
        FStar_Pervasives_Native.Some uu____372
  
type file_name = Prims.string
type module_name = Prims.string
type dependence =
  | UseInterface of module_name 
  | PreferInterface of module_name 
  | UseImplementation of module_name 
  | FriendImplementation of module_name 
let (uu___is_UseInterface : dependence -> Prims.bool) =
  fun projectee  ->
    match projectee with | UseInterface _0 -> true | uu____414 -> false
  
let (__proj__UseInterface__item___0 : dependence -> module_name) =
  fun projectee  -> match projectee with | UseInterface _0 -> _0 
let (uu___is_PreferInterface : dependence -> Prims.bool) =
  fun projectee  ->
    match projectee with | PreferInterface _0 -> true | uu____438 -> false
  
let (__proj__PreferInterface__item___0 : dependence -> module_name) =
  fun projectee  -> match projectee with | PreferInterface _0 -> _0 
let (uu___is_UseImplementation : dependence -> Prims.bool) =
  fun projectee  ->
    match projectee with | UseImplementation _0 -> true | uu____462 -> false
  
let (__proj__UseImplementation__item___0 : dependence -> module_name) =
  fun projectee  -> match projectee with | UseImplementation _0 -> _0 
let (uu___is_FriendImplementation : dependence -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | FriendImplementation _0 -> true
    | uu____486 -> false
  
let (__proj__FriendImplementation__item___0 : dependence -> module_name) =
  fun projectee  -> match projectee with | FriendImplementation _0 -> _0 
let (dep_to_string : dependence -> Prims.string) =
  fun uu___117_505  ->
    match uu___117_505 with
    | UseInterface f -> Prims.strcat "UseInterface " f
    | PreferInterface f -> Prims.strcat "PreferInterface " f
    | UseImplementation f -> Prims.strcat "UseImplementation " f
    | FriendImplementation f -> Prims.strcat "FriendImplementation " f
  
type dependences = dependence Prims.list
let empty_dependences : 'Auu____524 . unit -> 'Auu____524 Prims.list =
  fun uu____527  -> [] 
type dep_node = {
  edges: dependences ;
  color: color }
let (__proj__Mkdep_node__item__edges : dep_node -> dependences) =
  fun projectee  -> match projectee with | { edges; color;_} -> edges 
let (__proj__Mkdep_node__item__color : dep_node -> color) =
  fun projectee  -> match projectee with | { edges; color;_} -> color 
type dependence_graph =
  | Deps of dep_node FStar_Util.smap 
let (uu___is_Deps : dependence_graph -> Prims.bool) = fun projectee  -> true 
let (__proj__Deps__item___0 : dependence_graph -> dep_node FStar_Util.smap) =
  fun projectee  -> match projectee with | Deps _0 -> _0 
type deps =
  {
  dep_graph: dependence_graph ;
  file_system_map: files_for_module_name ;
  cmd_line_files: file_name Prims.list ;
  all_files: file_name Prims.list ;
  interfaces_with_inlining: module_name Prims.list }
let (__proj__Mkdeps__item__dep_graph : deps -> dependence_graph) =
  fun projectee  ->
    match projectee with
    | { dep_graph; file_system_map; cmd_line_files; all_files;
        interfaces_with_inlining;_} -> dep_graph
  
let (__proj__Mkdeps__item__file_system_map : deps -> files_for_module_name) =
  fun projectee  ->
    match projectee with
    | { dep_graph; file_system_map; cmd_line_files; all_files;
        interfaces_with_inlining;_} -> file_system_map
  
let (__proj__Mkdeps__item__cmd_line_files : deps -> file_name Prims.list) =
  fun projectee  ->
    match projectee with
    | { dep_graph; file_system_map; cmd_line_files; all_files;
        interfaces_with_inlining;_} -> cmd_line_files
  
let (__proj__Mkdeps__item__all_files : deps -> file_name Prims.list) =
  fun projectee  ->
    match projectee with
    | { dep_graph; file_system_map; cmd_line_files; all_files;
        interfaces_with_inlining;_} -> all_files
  
let (__proj__Mkdeps__item__interfaces_with_inlining :
  deps -> module_name Prims.list) =
  fun projectee  ->
    match projectee with
    | { dep_graph; file_system_map; cmd_line_files; all_files;
        interfaces_with_inlining;_} -> interfaces_with_inlining
  
let (deps_try_find :
  dependence_graph -> Prims.string -> dep_node FStar_Pervasives_Native.option)
  =
  fun uu____746  ->
    fun k  -> match uu____746 with | Deps m -> FStar_Util.smap_try_find m k
  
let (deps_add_dep : dependence_graph -> Prims.string -> dep_node -> unit) =
  fun uu____768  ->
    fun k  ->
      fun v1  -> match uu____768 with | Deps m -> FStar_Util.smap_add m k v1
  
let (deps_keys : dependence_graph -> Prims.string Prims.list) =
  fun uu____783  -> match uu____783 with | Deps m -> FStar_Util.smap_keys m 
let (deps_empty : unit -> dependence_graph) =
  fun uu____795  ->
    let uu____796 = FStar_Util.smap_create (Prims.parse_int "41")  in
    Deps uu____796
  
let (mk_deps :
  dependence_graph ->
    files_for_module_name ->
      file_name Prims.list ->
        file_name Prims.list -> module_name Prims.list -> deps)
  =
  fun dg  ->
    fun fs  ->
      fun c  ->
        fun a  ->
          fun i  ->
            {
              dep_graph = dg;
              file_system_map = fs;
              cmd_line_files = c;
              all_files = a;
              interfaces_with_inlining = i
            }
  
let (empty_deps : deps) =
  let uu____845 = deps_empty ()  in
  let uu____846 = FStar_Util.smap_create (Prims.parse_int "0")  in
  mk_deps uu____845 uu____846 [] [] [] 
let (module_name_of_dep : dependence -> module_name) =
  fun uu___118_867  ->
    match uu___118_867 with
    | UseInterface m -> m
    | PreferInterface m -> m
    | UseImplementation m -> m
    | FriendImplementation m -> m
  
let (resolve_module_name :
  files_for_module_name ->
    module_name -> module_name FStar_Pervasives_Native.option)
  =
  fun file_system_map  ->
    fun key  ->
      let uu____896 = FStar_Util.smap_try_find file_system_map key  in
      match uu____896 with
      | FStar_Pervasives_Native.Some
          (FStar_Pervasives_Native.Some fn,uu____923) ->
          let uu____945 = lowercase_module_name fn  in
          FStar_Pervasives_Native.Some uu____945
      | FStar_Pervasives_Native.Some
          (uu____948,FStar_Pervasives_Native.Some fn) ->
          let uu____971 = lowercase_module_name fn  in
          FStar_Pervasives_Native.Some uu____971
      | uu____974 -> FStar_Pervasives_Native.None
  
let (interface_of :
  files_for_module_name ->
    module_name -> file_name FStar_Pervasives_Native.option)
  =
  fun file_system_map  ->
    fun key  ->
      let uu____1007 = FStar_Util.smap_try_find file_system_map key  in
      match uu____1007 with
      | FStar_Pervasives_Native.Some
          (FStar_Pervasives_Native.Some iface,uu____1034) ->
          FStar_Pervasives_Native.Some iface
      | uu____1057 -> FStar_Pervasives_Native.None
  
let (implementation_of :
  files_for_module_name ->
    module_name -> file_name FStar_Pervasives_Native.option)
  =
  fun file_system_map  ->
    fun key  ->
      let uu____1090 = FStar_Util.smap_try_find file_system_map key  in
      match uu____1090 with
      | FStar_Pervasives_Native.Some
          (uu____1116,FStar_Pervasives_Native.Some impl) ->
          FStar_Pervasives_Native.Some impl
      | uu____1140 -> FStar_Pervasives_Native.None
  
let (has_interface : files_for_module_name -> module_name -> Prims.bool) =
  fun file_system_map  ->
    fun key  ->
      let uu____1169 = interface_of file_system_map key  in
      FStar_Option.isSome uu____1169
  
let (has_implementation : files_for_module_name -> module_name -> Prims.bool)
  =
  fun file_system_map  ->
    fun key  ->
      let uu____1189 = implementation_of file_system_map key  in
      FStar_Option.isSome uu____1189
  
let (cache_file_name : Prims.string -> Prims.string) =
  fun fn  ->
    let cache_fn =
      let uu____1206 = FStar_All.pipe_right fn FStar_Util.basename  in
      FStar_All.pipe_right uu____1206
        (fun fn1  ->
           let uu____1216 =
             let uu____1218 = FStar_Options.lax ()  in
             if uu____1218 then ".checked.lax" else ".checked"  in
           Prims.strcat fn1 uu____1216)
       in
    let mname = FStar_All.pipe_right fn module_name_of_file  in
    let should_already_be_there =
      FStar_All.pipe_right mname FStar_Options.should_be_already_cached  in
    let error_msg_exists path =
      FStar_Util.format2 "Expected %s to not be already checked but found %s"
        mname path
       in
    let error_msg_does_not_exist =
      FStar_Util.format1
        "Expected %s to be already checked but could not find it" mname
       in
    let raise_error1 msg =
      FStar_Errors.raise_err
        (FStar_Errors.Error_AlreadyCachedAssertionFailure, msg)
       in
    let uu____1258 = FStar_Options.find_file cache_fn  in
    match uu____1258 with
    | FStar_Pervasives_Native.Some path -> path
    | FStar_Pervasives_Native.None  ->
        if should_already_be_there
        then raise_error1 error_msg_does_not_exist
        else FStar_Options.prepend_cache_dir cache_fn
  
let (file_of_dep_aux :
  Prims.bool ->
    files_for_module_name -> file_name Prims.list -> dependence -> file_name)
  =
  fun use_checked_file  ->
    fun file_system_map  ->
      fun all_cmd_line_files  ->
        fun d  ->
          let cmd_line_has_impl key =
            FStar_All.pipe_right all_cmd_line_files
              (FStar_Util.for_some
                 (fun fn  ->
                    (is_implementation fn) &&
                      (let uu____1320 = lowercase_module_name fn  in
                       key = uu____1320)))
             in
          let maybe_use_cache_of f =
            if use_checked_file then cache_file_name f else f  in
          match d with
          | UseInterface key ->
              let uu____1339 = interface_of file_system_map key  in
              (match uu____1339 with
               | FStar_Pervasives_Native.None  ->
                   let uu____1346 =
                     let uu____1352 =
                       FStar_Util.format1
                         "Expected an interface for module %s, but couldn't find one"
                         key
                        in
                     (FStar_Errors.Fatal_MissingInterface, uu____1352)  in
                   FStar_Errors.raise_err uu____1346
               | FStar_Pervasives_Native.Some f -> f)
          | PreferInterface key when has_interface file_system_map key ->
              let uu____1362 =
                (cmd_line_has_impl key) &&
                  (let uu____1365 = FStar_Options.dep ()  in
                   FStar_Option.isNone uu____1365)
                 in
              if uu____1362
              then
                let uu____1372 = FStar_Options.expose_interfaces ()  in
                (if uu____1372
                 then
                   let uu____1376 =
                     let uu____1378 = implementation_of file_system_map key
                        in
                     FStar_Option.get uu____1378  in
                   maybe_use_cache_of uu____1376
                 else
                   (let uu____1385 =
                      let uu____1391 =
                        let uu____1393 =
                          let uu____1395 =
                            implementation_of file_system_map key  in
                          FStar_Option.get uu____1395  in
                        let uu____1400 =
                          let uu____1402 = interface_of file_system_map key
                             in
                          FStar_Option.get uu____1402  in
                        FStar_Util.format3
                          "You may have a cyclic dependence on module %s: use --dep full to confirm. Alternatively, invoking fstar with %s on the command line breaks the abstraction imposed by its interface %s; if you really want this behavior add the option '--expose_interfaces'"
                          key uu____1393 uu____1400
                         in
                      (FStar_Errors.Fatal_MissingExposeInterfacesOption,
                        uu____1391)
                       in
                    FStar_Errors.raise_err uu____1385))
              else
                (let uu____1412 =
                   let uu____1414 = interface_of file_system_map key  in
                   FStar_Option.get uu____1414  in
                 maybe_use_cache_of uu____1412)
          | PreferInterface key ->
              let uu____1421 = implementation_of file_system_map key  in
              (match uu____1421 with
               | FStar_Pervasives_Native.None  ->
                   let uu____1427 =
                     let uu____1433 =
                       FStar_Util.format1
                         "Expected an implementation of module %s, but couldn't find one"
                         key
                        in
                     (FStar_Errors.Fatal_MissingImplementation, uu____1433)
                      in
                   FStar_Errors.raise_err uu____1427
               | FStar_Pervasives_Native.Some f -> maybe_use_cache_of f)
          | UseImplementation key ->
              let uu____1443 = implementation_of file_system_map key  in
              (match uu____1443 with
               | FStar_Pervasives_Native.None  ->
                   let uu____1449 =
                     let uu____1455 =
                       FStar_Util.format1
                         "Expected an implementation of module %s, but couldn't find one"
                         key
                        in
                     (FStar_Errors.Fatal_MissingImplementation, uu____1455)
                      in
                   FStar_Errors.raise_err uu____1449
               | FStar_Pervasives_Native.Some f -> maybe_use_cache_of f)
          | FriendImplementation key ->
              let uu____1465 = implementation_of file_system_map key  in
              (match uu____1465 with
               | FStar_Pervasives_Native.None  ->
                   let uu____1471 =
                     let uu____1477 =
                       FStar_Util.format1
                         "Expected an implementation of module %s, but couldn't find one"
                         key
                        in
                     (FStar_Errors.Fatal_MissingImplementation, uu____1477)
                      in
                   FStar_Errors.raise_err uu____1471
               | FStar_Pervasives_Native.Some f -> maybe_use_cache_of f)
  
let (file_of_dep :
  files_for_module_name -> file_name Prims.list -> dependence -> file_name) =
  file_of_dep_aux false 
let (dependences_of :
  files_for_module_name ->
    dependence_graph ->
      file_name Prims.list -> file_name -> file_name Prims.list)
  =
  fun file_system_map  ->
    fun deps  ->
      fun all_cmd_line_files  ->
        fun fn  ->
          let uu____1538 = deps_try_find deps fn  in
          match uu____1538 with
          | FStar_Pervasives_Native.None  -> empty_dependences ()
          | FStar_Pervasives_Native.Some
              { edges = deps1; color = uu____1546;_} ->
              FStar_List.map (file_of_dep file_system_map all_cmd_line_files)
                deps1
  
let (print_graph : dependence_graph -> unit) =
  fun graph  ->
    FStar_Util.print_endline
      "A DOT-format graph has been dumped in the current directory as dep.graph";
    FStar_Util.print_endline
      "With GraphViz installed, try: fdp -Tpng -odep.png dep.graph";
    FStar_Util.print_endline
      "Hint: cat dep.graph | grep -v _ | grep -v prims";
    (let uu____1560 =
       let uu____1562 =
         let uu____1564 =
           let uu____1566 =
             let uu____1570 =
               let uu____1574 = deps_keys graph  in
               FStar_List.unique uu____1574  in
             FStar_List.collect
               (fun k  ->
                  let deps =
                    let uu____1588 =
                      let uu____1589 = deps_try_find graph k  in
                      FStar_Util.must uu____1589  in
                    uu____1588.edges  in
                  let r s = FStar_Util.replace_char s 46 95  in
                  let print7 dep1 =
                    let uu____1610 =
                      let uu____1612 = lowercase_module_name k  in
                      r uu____1612  in
                    FStar_Util.format2 "  \"%s\" -> \"%s\"" uu____1610
                      (r (module_name_of_dep dep1))
                     in
                  FStar_List.map print7 deps) uu____1570
              in
           FStar_String.concat "\n" uu____1566  in
         Prims.strcat uu____1564 "\n}\n"  in
       Prims.strcat "digraph {\n" uu____1562  in
     FStar_Util.write_file "dep.graph" uu____1560)
  
let (build_inclusion_candidates_list :
  unit -> (Prims.string * Prims.string) Prims.list) =
  fun uu____1633  ->
    let include_directories = FStar_Options.include_path ()  in
    let include_directories1 =
      FStar_List.map FStar_Util.normalize_file_path include_directories  in
    let include_directories2 = FStar_List.unique include_directories1  in
    let cwd =
      let uu____1659 = FStar_Util.getcwd ()  in
      FStar_Util.normalize_file_path uu____1659  in
    FStar_List.concatMap
      (fun d  ->
         if FStar_Util.is_directory d
         then
           let files = FStar_Util.readdir d  in
           FStar_List.filter_map
             (fun f  ->
                let f1 = FStar_Util.basename f  in
                let uu____1699 = check_and_strip_suffix f1  in
                FStar_All.pipe_right uu____1699
                  (FStar_Util.map_option
                     (fun longname  ->
                        let full_path =
                          if d = cwd then f1 else FStar_Util.join_paths d f1
                           in
                        (longname, full_path)))) files
         else
           (let uu____1736 =
              let uu____1742 =
                FStar_Util.format1 "not a valid include directory: %s\n" d
                 in
              (FStar_Errors.Fatal_NotValidIncludeDirectory, uu____1742)  in
            FStar_Errors.raise_err uu____1736)) include_directories2
  
let (build_map : Prims.string Prims.list -> files_for_module_name) =
  fun filenames  ->
    let map1 = FStar_Util.smap_create (Prims.parse_int "41")  in
    let add_entry key full_path =
      let uu____1805 = FStar_Util.smap_try_find map1 key  in
      match uu____1805 with
      | FStar_Pervasives_Native.Some (intf,impl) ->
          let uu____1852 = is_interface full_path  in
          if uu____1852
          then
            FStar_Util.smap_add map1 key
              ((FStar_Pervasives_Native.Some full_path), impl)
          else
            FStar_Util.smap_add map1 key
              (intf, (FStar_Pervasives_Native.Some full_path))
      | FStar_Pervasives_Native.None  ->
          let uu____1901 = is_interface full_path  in
          if uu____1901
          then
            FStar_Util.smap_add map1 key
              ((FStar_Pervasives_Native.Some full_path),
                FStar_Pervasives_Native.None)
          else
            FStar_Util.smap_add map1 key
              (FStar_Pervasives_Native.None,
                (FStar_Pervasives_Native.Some full_path))
       in
    (let uu____1943 = build_inclusion_candidates_list ()  in
     FStar_List.iter
       (fun uu____1961  ->
          match uu____1961 with
          | (longname,full_path) ->
              add_entry (FStar_String.lowercase longname) full_path)
       uu____1943);
    FStar_List.iter
      (fun f  ->
         let uu____1980 = lowercase_module_name f  in add_entry uu____1980 f)
      filenames;
    map1
  
let (enter_namespace :
  files_for_module_name ->
    files_for_module_name -> Prims.string -> Prims.bool)
  =
  fun original_map  ->
    fun working_map  ->
      fun prefix1  ->
        let found = FStar_Util.mk_ref false  in
        let prefix2 = Prims.strcat prefix1 "."  in
        (let uu____2012 =
           let uu____2016 = FStar_Util.smap_keys original_map  in
           FStar_List.unique uu____2016  in
         FStar_List.iter
           (fun k  ->
              if FStar_Util.starts_with k prefix2
              then
                let suffix =
                  FStar_String.substring k (FStar_String.length prefix2)
                    ((FStar_String.length k) - (FStar_String.length prefix2))
                   in
                let filename =
                  let uu____2052 = FStar_Util.smap_try_find original_map k
                     in
                  FStar_Util.must uu____2052  in
                (FStar_Util.smap_add working_map suffix filename;
                 FStar_ST.op_Colon_Equals found true)
              else ()) uu____2012);
        FStar_ST.op_Bang found
  
let (string_of_lid : FStar_Ident.lident -> Prims.bool -> Prims.string) =
  fun l  ->
    fun last1  ->
      let suffix =
        if last1 then [(l.FStar_Ident.ident).FStar_Ident.idText] else []  in
      let names =
        let uu____2216 =
          FStar_List.map (fun x  -> x.FStar_Ident.idText) l.FStar_Ident.ns
           in
        FStar_List.append uu____2216 suffix  in
      FStar_String.concat "." names
  
let (lowercase_join_longident :
  FStar_Ident.lident -> Prims.bool -> Prims.string) =
  fun l  ->
    fun last1  ->
      let uu____2239 = string_of_lid l last1  in
      FStar_String.lowercase uu____2239
  
let (namespace_of_lid : FStar_Ident.lident -> Prims.string) =
  fun l  ->
    let uu____2248 = FStar_List.map FStar_Ident.text_of_id l.FStar_Ident.ns
       in
    FStar_String.concat "_" uu____2248
  
let (check_module_declaration_against_filename :
  FStar_Ident.lident -> Prims.string -> unit) =
  fun lid  ->
    fun filename  ->
      let k' = lowercase_join_longident lid true  in
      let uu____2270 =
        let uu____2272 =
          let uu____2274 =
            let uu____2276 =
              let uu____2280 = FStar_Util.basename filename  in
              check_and_strip_suffix uu____2280  in
            FStar_Util.must uu____2276  in
          FStar_String.lowercase uu____2274  in
        uu____2272 <> k'  in
      if uu____2270
      then
        let uu____2285 = FStar_Ident.range_of_lid lid  in
        let uu____2286 =
          let uu____2292 =
            let uu____2294 = string_of_lid lid true  in
            FStar_Util.format2
              "The module declaration \"module %s\" found in file %s does not match its filename. Dependencies will be incorrect and the module will not be verified.\n"
              uu____2294 filename
             in
          (FStar_Errors.Error_ModuleFileNameMismatch, uu____2292)  in
        FStar_Errors.log_issue uu____2285 uu____2286
      else ()
  
exception Exit 
let (uu___is_Exit : Prims.exn -> Prims.bool) =
  fun projectee  ->
    match projectee with | Exit  -> true | uu____2310 -> false
  
let (hard_coded_dependencies :
  Prims.string -> (FStar_Ident.lident * open_kind) Prims.list) =
  fun full_filename  ->
    let filename = FStar_Util.basename full_filename  in
    let corelibs =
      let uu____2332 = FStar_Options.prims_basename ()  in
      let uu____2334 =
        let uu____2338 = FStar_Options.pervasives_basename ()  in
        let uu____2340 =
          let uu____2344 = FStar_Options.pervasives_native_basename ()  in
          [uu____2344]  in
        uu____2338 :: uu____2340  in
      uu____2332 :: uu____2334  in
    if FStar_List.mem filename corelibs
    then []
    else
      (let implicit_deps =
         [(FStar_Parser_Const.fstar_ns_lid, Open_namespace);
         (FStar_Parser_Const.prims_lid, Open_module);
         (FStar_Parser_Const.pervasives_lid, Open_module)]  in
       let uu____2387 =
         let uu____2390 = lowercase_module_name full_filename  in
         namespace_of_module uu____2390  in
       match uu____2387 with
       | FStar_Pervasives_Native.None  -> implicit_deps
       | FStar_Pervasives_Native.Some ns ->
           FStar_List.append implicit_deps [(ns, Open_namespace)])
  
let (dep_subsumed_by : dependence -> dependence -> Prims.bool) =
  fun d  ->
    fun d'  ->
      match (d, d') with
      | (PreferInterface l',FriendImplementation l) -> l = l'
      | uu____2429 -> d = d'
  
let (collect_one :
  files_for_module_name ->
    Prims.string ->
      (dependence Prims.list * dependence Prims.list * Prims.bool))
  =
  fun original_map  ->
    fun filename  ->
      let deps = FStar_Util.mk_ref []  in
      let mo_roots = FStar_Util.mk_ref []  in
      let has_inline_for_extraction = FStar_Util.mk_ref false  in
      let set_interface_inlining uu____2494 =
        let uu____2495 = is_interface filename  in
        if uu____2495
        then FStar_ST.op_Colon_Equals has_inline_for_extraction true
        else ()  in
      let add_dep deps1 d =
        let uu____2702 =
          let uu____2704 =
            let uu____2706 = FStar_ST.op_Bang deps1  in
            FStar_List.existsML (dep_subsumed_by d) uu____2706  in
          Prims.op_Negation uu____2704  in
        if uu____2702
        then
          let uu____2775 =
            let uu____2778 = FStar_ST.op_Bang deps1  in d :: uu____2778  in
          FStar_ST.op_Colon_Equals deps1 uu____2775
        else ()  in
      let working_map = FStar_Util.smap_copy original_map  in
      let dep_edge module_name = PreferInterface module_name  in
      let add_dependence_edge original_or_working_map lid =
        let key = lowercase_join_longident lid true  in
        let uu____2959 = resolve_module_name original_or_working_map key  in
        match uu____2959 with
        | FStar_Pervasives_Native.Some module_name ->
            (add_dep deps (dep_edge module_name);
             (let uu____3002 =
                (has_interface original_or_working_map module_name) &&
                  (has_implementation original_or_working_map module_name)
                 in
              if uu____3002
              then add_dep mo_roots (UseImplementation module_name)
              else ());
             true)
        | uu____3041 -> false  in
      let record_open_module let_open lid =
        let uu____3060 =
          (let_open && (add_dependence_edge working_map lid)) ||
            ((Prims.op_Negation let_open) &&
               (add_dependence_edge original_map lid))
           in
        if uu____3060
        then true
        else
          (if let_open
           then
             (let uu____3069 = FStar_Ident.range_of_lid lid  in
              let uu____3070 =
                let uu____3076 =
                  let uu____3078 = string_of_lid lid true  in
                  FStar_Util.format1 "Module not found: %s" uu____3078  in
                (FStar_Errors.Warning_ModuleOrFileNotFoundWarning,
                  uu____3076)
                 in
              FStar_Errors.log_issue uu____3069 uu____3070)
           else ();
           false)
         in
      let record_open_namespace lid =
        let key = lowercase_join_longident lid true  in
        let r = enter_namespace original_map working_map key  in
        if Prims.op_Negation r
        then
          let uu____3098 = FStar_Ident.range_of_lid lid  in
          let uu____3099 =
            let uu____3105 =
              let uu____3107 = string_of_lid lid true  in
              FStar_Util.format1
                "No modules in namespace %s and no file with that name either"
                uu____3107
               in
            (FStar_Errors.Warning_ModuleOrFileNotFoundWarning, uu____3105)
             in
          FStar_Errors.log_issue uu____3098 uu____3099
        else ()  in
      let record_open let_open lid =
        let uu____3127 = record_open_module let_open lid  in
        if uu____3127
        then ()
        else
          if Prims.op_Negation let_open
          then record_open_namespace lid
          else ()
         in
      let record_open_module_or_namespace uu____3144 =
        match uu____3144 with
        | (lid,kind) ->
            (match kind with
             | Open_namespace  -> record_open_namespace lid
             | Open_module  ->
                 let uu____3151 = record_open_module false lid  in ())
         in
      let record_module_alias ident lid =
        let key =
          let uu____3168 = FStar_Ident.text_of_id ident  in
          FStar_String.lowercase uu____3168  in
        let alias = lowercase_join_longident lid true  in
        let uu____3173 = FStar_Util.smap_try_find original_map alias  in
        match uu____3173 with
        | FStar_Pervasives_Native.Some deps_of_aliased_module ->
            (FStar_Util.smap_add working_map key deps_of_aliased_module; true)
        | FStar_Pervasives_Native.None  ->
            ((let uu____3241 = FStar_Ident.range_of_lid lid  in
              let uu____3242 =
                let uu____3248 =
                  FStar_Util.format1 "module not found in search path: %s\n"
                    alias
                   in
                (FStar_Errors.Warning_ModuleOrFileNotFoundWarning,
                  uu____3248)
                 in
              FStar_Errors.log_issue uu____3241 uu____3242);
             false)
         in
      let add_dep_on_module module_name =
        let uu____3259 = add_dependence_edge working_map module_name  in
        if uu____3259
        then ()
        else
          (let uu____3264 = FStar_Options.debug_any ()  in
           if uu____3264
           then
             let uu____3267 = FStar_Ident.range_of_lid module_name  in
             let uu____3268 =
               let uu____3274 =
                 let uu____3276 = FStar_Ident.string_of_lid module_name  in
                 FStar_Util.format1 "Unbound module reference %s" uu____3276
                  in
               (FStar_Errors.Warning_UnboundModuleReference, uu____3274)  in
             FStar_Errors.log_issue uu____3267 uu____3268
           else ())
         in
      let record_lid lid =
        match lid.FStar_Ident.ns with
        | [] -> ()
        | uu____3288 ->
            let module_name = FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
            add_dep_on_module module_name
         in
      let auto_open = hard_coded_dependencies filename  in
      FStar_List.iter record_open_module_or_namespace auto_open;
      (let num_of_toplevelmods = FStar_Util.mk_ref (Prims.parse_int "0")  in
       let rec collect_module uu___119_3416 =
         match uu___119_3416 with
         | FStar_Parser_AST.Module (lid,decls) ->
             (check_module_declaration_against_filename lid filename;
              if
                (FStar_List.length lid.FStar_Ident.ns) >
                  (Prims.parse_int "0")
              then
                (let uu____3427 =
                   let uu____3429 = namespace_of_lid lid  in
                   enter_namespace original_map working_map uu____3429  in
                 ())
              else ();
              collect_decls decls)
         | FStar_Parser_AST.Interface (lid,decls,uu____3435) ->
             (check_module_declaration_against_filename lid filename;
              if
                (FStar_List.length lid.FStar_Ident.ns) >
                  (Prims.parse_int "0")
              then
                (let uu____3446 =
                   let uu____3448 = namespace_of_lid lid  in
                   enter_namespace original_map working_map uu____3448  in
                 ())
              else ();
              collect_decls decls)
       
       and collect_decls decls =
         FStar_List.iter
           (fun x  ->
              collect_decl x.FStar_Parser_AST.d;
              FStar_List.iter collect_term x.FStar_Parser_AST.attrs;
              if
                FStar_List.contains FStar_Parser_AST.Inline_for_extraction
                  x.FStar_Parser_AST.quals
              then set_interface_inlining ()
              else ()) decls
       
       and collect_decl d =
         match d with
         | FStar_Parser_AST.Include lid -> record_open false lid
         | FStar_Parser_AST.Open lid -> record_open false lid
         | FStar_Parser_AST.Friend lid ->
             let uu____3470 =
               let uu____3471 = lowercase_join_longident lid true  in
               FriendImplementation uu____3471  in
             add_dep deps uu____3470
         | FStar_Parser_AST.ModuleAbbrev (ident,lid) ->
             let uu____3509 = record_module_alias ident lid  in
             if uu____3509
             then
               let uu____3512 =
                 let uu____3513 = lowercase_join_longident lid true  in
                 dep_edge uu____3513  in
               add_dep deps uu____3512
             else ()
         | FStar_Parser_AST.TopLevelLet (uu____3551,patterms) ->
             FStar_List.iter
               (fun uu____3573  ->
                  match uu____3573 with
                  | (pat,t) -> (collect_pattern pat; collect_term t))
               patterms
         | FStar_Parser_AST.Main t -> collect_term t
         | FStar_Parser_AST.Splice (uu____3582,t) -> collect_term t
         | FStar_Parser_AST.Assume (uu____3588,t) -> collect_term t
         | FStar_Parser_AST.SubEffect
             { FStar_Parser_AST.msource = uu____3590;
               FStar_Parser_AST.mdest = uu____3591;
               FStar_Parser_AST.lift_op = FStar_Parser_AST.NonReifiableLift t;_}
             -> collect_term t
         | FStar_Parser_AST.SubEffect
             { FStar_Parser_AST.msource = uu____3593;
               FStar_Parser_AST.mdest = uu____3594;
               FStar_Parser_AST.lift_op = FStar_Parser_AST.LiftForFree t;_}
             -> collect_term t
         | FStar_Parser_AST.Val (uu____3596,t) -> collect_term t
         | FStar_Parser_AST.SubEffect
             { FStar_Parser_AST.msource = uu____3598;
               FStar_Parser_AST.mdest = uu____3599;
               FStar_Parser_AST.lift_op = FStar_Parser_AST.ReifiableLift
                 (t0,t1);_}
             -> (collect_term t0; collect_term t1)
         | FStar_Parser_AST.Tycon (uu____3603,tc,ts) ->
             (if tc then record_lid FStar_Parser_Const.mk_class_lid else ();
              (let ts1 =
                 FStar_List.map
                   (fun uu____3642  ->
                      match uu____3642 with | (x,docnik) -> x) ts
                  in
               FStar_List.iter collect_tycon ts1))
         | FStar_Parser_AST.Exception (uu____3655,t) ->
             FStar_Util.iter_opt t collect_term
         | FStar_Parser_AST.NewEffect ed -> collect_effect_decl ed
         | FStar_Parser_AST.Fsdoc uu____3662 -> ()
         | FStar_Parser_AST.Pragma uu____3663 -> ()
         | FStar_Parser_AST.TopLevelModule lid ->
             (FStar_Util.incr num_of_toplevelmods;
              (let uu____3699 =
                 let uu____3701 = FStar_ST.op_Bang num_of_toplevelmods  in
                 uu____3701 > (Prims.parse_int "1")  in
               if uu____3699
               then
                 let uu____3748 =
                   let uu____3754 =
                     let uu____3756 = string_of_lid lid true  in
                     FStar_Util.format1
                       "Automatic dependency analysis demands one module per file (module %s not supported)"
                       uu____3756
                      in
                   (FStar_Errors.Fatal_OneModulePerFile, uu____3754)  in
                 let uu____3761 = FStar_Ident.range_of_lid lid  in
                 FStar_Errors.raise_error uu____3748 uu____3761
               else ()))
       
       and collect_tycon uu___120_3764 =
         match uu___120_3764 with
         | FStar_Parser_AST.TyconAbstract (uu____3765,binders,k) ->
             (collect_binders binders; FStar_Util.iter_opt k collect_term)
         | FStar_Parser_AST.TyconAbbrev (uu____3777,binders,k,t) ->
             (collect_binders binders;
              FStar_Util.iter_opt k collect_term;
              collect_term t)
         | FStar_Parser_AST.TyconRecord (uu____3791,binders,k,identterms) ->
             (collect_binders binders;
              FStar_Util.iter_opt k collect_term;
              FStar_List.iter
                (fun uu____3837  ->
                   match uu____3837 with
                   | (uu____3846,t,uu____3848) -> collect_term t) identterms)
         | FStar_Parser_AST.TyconVariant (uu____3853,binders,k,identterms) ->
             (collect_binders binders;
              FStar_Util.iter_opt k collect_term;
              FStar_List.iter
                (fun uu____3915  ->
                   match uu____3915 with
                   | (uu____3929,t,uu____3931,uu____3932) ->
                       FStar_Util.iter_opt t collect_term) identterms)
       
       and collect_effect_decl uu___121_3943 =
         match uu___121_3943 with
         | FStar_Parser_AST.DefineEffect (uu____3944,binders,t,decls) ->
             (collect_binders binders; collect_term t; collect_decls decls)
         | FStar_Parser_AST.RedefineEffect (uu____3958,binders,t) ->
             (collect_binders binders; collect_term t)
       
       and collect_binders binders = FStar_List.iter collect_binder binders
       
       and collect_binder b =
         collect_aqual b.FStar_Parser_AST.aqual;
         (match b with
          | { FStar_Parser_AST.b = FStar_Parser_AST.Annotated (uu____3971,t);
              FStar_Parser_AST.brange = uu____3973;
              FStar_Parser_AST.blevel = uu____3974;
              FStar_Parser_AST.aqual = uu____3975;_} -> collect_term t
          | {
              FStar_Parser_AST.b = FStar_Parser_AST.TAnnotated (uu____3978,t);
              FStar_Parser_AST.brange = uu____3980;
              FStar_Parser_AST.blevel = uu____3981;
              FStar_Parser_AST.aqual = uu____3982;_} -> collect_term t
          | { FStar_Parser_AST.b = FStar_Parser_AST.NoName t;
              FStar_Parser_AST.brange = uu____3986;
              FStar_Parser_AST.blevel = uu____3987;
              FStar_Parser_AST.aqual = uu____3988;_} -> collect_term t
          | uu____3991 -> ())
       
       and collect_aqual uu___122_3992 =
         match uu___122_3992 with
         | FStar_Pervasives_Native.Some (FStar_Parser_AST.Meta t) ->
             collect_term t
         | uu____3996 -> ()
       
       and collect_term t = collect_term' t.FStar_Parser_AST.tm
       
       and collect_constant uu___123_4000 =
         match uu___123_4000 with
         | FStar_Const.Const_int
             (uu____4001,FStar_Pervasives_Native.Some (signedness,width)) ->
             let u =
               match signedness with
               | FStar_Const.Unsigned  -> "u"
               | FStar_Const.Signed  -> ""  in
             let w =
               match width with
               | FStar_Const.Int8  -> "8"
               | FStar_Const.Int16  -> "16"
               | FStar_Const.Int32  -> "32"
               | FStar_Const.Int64  -> "64"  in
             let uu____4028 =
               let uu____4029 = FStar_Util.format2 "fstar.%sint%s" u w  in
               dep_edge uu____4029  in
             add_dep deps uu____4028
         | FStar_Const.Const_char uu____4065 ->
             add_dep deps (dep_edge "fstar.char")
         | FStar_Const.Const_float uu____4101 ->
             add_dep deps (dep_edge "fstar.float")
         | uu____4136 -> ()
       
       and collect_term' uu___126_4137 =
         match uu___126_4137 with
         | FStar_Parser_AST.Wild  -> ()
         | FStar_Parser_AST.Const c -> collect_constant c
         | FStar_Parser_AST.Op (s,ts) ->
             ((let uu____4146 =
                 let uu____4148 = FStar_Ident.text_of_id s  in
                 uu____4148 = "@"  in
               if uu____4146
               then
                 let uu____4153 =
                   let uu____4154 =
                     let uu____4155 =
                       FStar_Ident.path_of_text "FStar.List.Tot.Base.append"
                        in
                     FStar_Ident.lid_of_path uu____4155
                       FStar_Range.dummyRange
                      in
                   FStar_Parser_AST.Name uu____4154  in
                 collect_term' uu____4153
               else ());
              FStar_List.iter collect_term ts)
         | FStar_Parser_AST.Tvar uu____4159 -> ()
         | FStar_Parser_AST.Uvar uu____4160 -> ()
         | FStar_Parser_AST.Var lid -> record_lid lid
         | FStar_Parser_AST.Projector (lid,uu____4163) -> record_lid lid
         | FStar_Parser_AST.Discrim lid -> record_lid lid
         | FStar_Parser_AST.Name lid -> record_lid lid
         | FStar_Parser_AST.Construct (lid,termimps) ->
             (if (FStar_List.length termimps) = (Prims.parse_int "1")
              then record_lid lid
              else ();
              FStar_List.iter
                (fun uu____4197  ->
                   match uu____4197 with | (t,uu____4203) -> collect_term t)
                termimps)
         | FStar_Parser_AST.Abs (pats,t) ->
             (collect_patterns pats; collect_term t)
         | FStar_Parser_AST.App (t1,t2,uu____4213) ->
             (collect_term t1; collect_term t2)
         | FStar_Parser_AST.Let (uu____4215,patterms,t) ->
             (FStar_List.iter
                (fun uu____4265  ->
                   match uu____4265 with
                   | (attrs_opt,(pat,t1)) ->
                       ((let uu____4294 =
                           FStar_Util.map_opt attrs_opt
                             (FStar_List.iter collect_term)
                            in
                         ());
                        collect_pattern pat;
                        collect_term t1)) patterms;
              collect_term t)
         | FStar_Parser_AST.LetOpen (lid,t) ->
             (record_open true lid; collect_term t)
         | FStar_Parser_AST.Bind (uu____4304,t1,t2) ->
             (collect_term t1; collect_term t2)
         | FStar_Parser_AST.Seq (t1,t2) -> (collect_term t1; collect_term t2)
         | FStar_Parser_AST.If (t1,t2,t3) ->
             (collect_term t1; collect_term t2; collect_term t3)
         | FStar_Parser_AST.Match (t,bs) ->
             (collect_term t; collect_branches bs)
         | FStar_Parser_AST.TryWith (t,bs) ->
             (collect_term t; collect_branches bs)
         | FStar_Parser_AST.Ascribed (t1,t2,FStar_Pervasives_Native.None ) ->
             (collect_term t1; collect_term t2)
         | FStar_Parser_AST.Ascribed (t1,t2,FStar_Pervasives_Native.Some tac)
             -> (collect_term t1; collect_term t2; collect_term tac)
         | FStar_Parser_AST.Record (t,idterms) ->
             (FStar_Util.iter_opt t collect_term;
              FStar_List.iter
                (fun uu____4400  ->
                   match uu____4400 with | (uu____4405,t1) -> collect_term t1)
                idterms)
         | FStar_Parser_AST.Project (t,uu____4408) -> collect_term t
         | FStar_Parser_AST.Product (binders,t) ->
             (collect_binders binders; collect_term t)
         | FStar_Parser_AST.Sum (binders,t) ->
             (FStar_List.iter
                (fun uu___124_4437  ->
                   match uu___124_4437 with
                   | FStar_Util.Inl b -> collect_binder b
                   | FStar_Util.Inr t1 -> collect_term t1) binders;
              collect_term t)
         | FStar_Parser_AST.QForall (binders,ts,t) ->
             (collect_binders binders;
              FStar_List.iter (FStar_List.iter collect_term) ts;
              collect_term t)
         | FStar_Parser_AST.QExists (binders,ts,t) ->
             (collect_binders binders;
              FStar_List.iter (FStar_List.iter collect_term) ts;
              collect_term t)
         | FStar_Parser_AST.Refine (binder,t) ->
             (collect_binder binder; collect_term t)
         | FStar_Parser_AST.NamedTyp (uu____4485,t) -> collect_term t
         | FStar_Parser_AST.Paren t -> collect_term t
         | FStar_Parser_AST.Requires (t,uu____4489) -> collect_term t
         | FStar_Parser_AST.Ensures (t,uu____4497) -> collect_term t
         | FStar_Parser_AST.Labeled (t,uu____4505,uu____4506) ->
             collect_term t
         | FStar_Parser_AST.Quote (t,uu____4512) -> collect_term t
         | FStar_Parser_AST.Antiquote t -> collect_term t
         | FStar_Parser_AST.VQuote t -> collect_term t
         | FStar_Parser_AST.Attributes cattributes ->
             FStar_List.iter collect_term cattributes
         | FStar_Parser_AST.CalcProof (rel,init1,steps) ->
             ((let uu____4526 = FStar_Ident.lid_of_str "FStar.Calc"  in
               add_dep_on_module uu____4526);
              collect_term rel;
              collect_term init1;
              FStar_List.iter
                (fun uu___125_4536  ->
                   match uu___125_4536 with
                   | FStar_Parser_AST.CalcStep (rel1,just,next) ->
                       (collect_term rel1;
                        collect_term just;
                        collect_term next)) steps)
       
       and collect_patterns ps = FStar_List.iter collect_pattern ps
       
       and collect_pattern p = collect_pattern' p.FStar_Parser_AST.pat
       
       and collect_pattern' uu___127_4546 =
         match uu___127_4546 with
         | FStar_Parser_AST.PatVar (uu____4547,aqual) -> collect_aqual aqual
         | FStar_Parser_AST.PatTvar (uu____4553,aqual) -> collect_aqual aqual
         | FStar_Parser_AST.PatWild aqual -> collect_aqual aqual
         | FStar_Parser_AST.PatOp uu____4562 -> ()
         | FStar_Parser_AST.PatConst uu____4563 -> ()
         | FStar_Parser_AST.PatApp (p,ps) ->
             (collect_pattern p; collect_patterns ps)
         | FStar_Parser_AST.PatName uu____4571 -> ()
         | FStar_Parser_AST.PatList ps -> collect_patterns ps
         | FStar_Parser_AST.PatOr ps -> collect_patterns ps
         | FStar_Parser_AST.PatTuple (ps,uu____4579) -> collect_patterns ps
         | FStar_Parser_AST.PatRecord lidpats ->
             FStar_List.iter
               (fun uu____4600  ->
                  match uu____4600 with | (uu____4605,p) -> collect_pattern p)
               lidpats
         | FStar_Parser_AST.PatAscribed (p,(t,FStar_Pervasives_Native.None ))
             -> (collect_pattern p; collect_term t)
         | FStar_Parser_AST.PatAscribed
             (p,(t,FStar_Pervasives_Native.Some tac)) ->
             (collect_pattern p; collect_term t; collect_term tac)
       
       and collect_branches bs = FStar_List.iter collect_branch bs
       
       and collect_branch uu____4650 =
         match uu____4650 with
         | (pat,t1,t2) ->
             (collect_pattern pat;
              FStar_Util.iter_opt t1 collect_term;
              collect_term t2)
        in
       let uu____4668 = FStar_Parser_Driver.parse_file filename  in
       match uu____4668 with
       | (ast,uu____4692) ->
           let mname = lowercase_module_name filename  in
           ((let uu____4710 =
               (is_interface filename) &&
                 (has_implementation original_map mname)
                in
             if uu____4710
             then add_dep mo_roots (UseImplementation mname)
             else ());
            collect_module ast;
            (let uu____4749 = FStar_ST.op_Bang deps  in
             let uu____4797 = FStar_ST.op_Bang mo_roots  in
             let uu____4845 = FStar_ST.op_Bang has_inline_for_extraction  in
             (uu____4749, uu____4797, uu____4845))))
  
let (collect_one_cache :
  (dependence Prims.list * dependence Prims.list * Prims.bool)
    FStar_Util.smap FStar_ST.ref)
  =
  let uu____4922 = FStar_Util.smap_create (Prims.parse_int "0")  in
  FStar_Util.mk_ref uu____4922 
let (set_collect_one_cache :
  (dependence Prims.list * dependence Prims.list * Prims.bool)
    FStar_Util.smap -> unit)
  = fun cache  -> FStar_ST.op_Colon_Equals collect_one_cache cache 
let (dep_graph_copy : dependence_graph -> dependence_graph) =
  fun dep_graph  ->
    let uu____5044 = dep_graph  in
    match uu____5044 with
    | Deps g -> let uu____5048 = FStar_Util.smap_copy g  in Deps uu____5048
  
let (topological_dependences_of :
  files_for_module_name ->
    dependence_graph ->
      Prims.string Prims.list ->
        file_name Prims.list ->
          Prims.bool -> (file_name Prims.list * Prims.bool))
  =
  fun file_system_map  ->
    fun dep_graph  ->
      fun interfaces_needing_inlining  ->
        fun root_files  ->
          fun for_extraction  ->
            let rec all_friend_deps_1 dep_graph1 cycle uu____5193 filename =
              match uu____5193 with
              | (all_friends,all_files) ->
                  let dep_node =
                    let uu____5234 = deps_try_find dep_graph1 filename  in
                    FStar_Util.must uu____5234  in
                  (match dep_node.color with
                   | Gray  ->
                       failwith
                         "Impossible: cycle detected after cycle detection has passed"
                   | Black  -> (all_friends, all_files)
                   | White  ->
                       ((let uu____5265 = FStar_Options.debug_any ()  in
                         if uu____5265
                         then
                           let uu____5268 =
                             let uu____5270 =
                               FStar_List.map dep_to_string dep_node.edges
                                in
                             FStar_String.concat ", " uu____5270  in
                           FStar_Util.print2
                             "Visiting %s: direct deps are %s\n" filename
                             uu____5268
                         else ());
                        deps_add_dep dep_graph1 filename
                          (let uu___131_5281 = dep_node  in
                           { edges = (uu___131_5281.edges); color = Gray });
                        (let uu____5282 =
                           let uu____5293 =
                             dependences_of file_system_map dep_graph1
                               root_files filename
                              in
                           all_friend_deps dep_graph1 cycle
                             (all_friends, all_files) uu____5293
                            in
                         match uu____5282 with
                         | (all_friends1,all_files1) ->
                             (deps_add_dep dep_graph1 filename
                                (let uu___132_5329 = dep_node  in
                                 {
                                   edges = (uu___132_5329.edges);
                                   color = Black
                                 });
                              (let uu____5331 = FStar_Options.debug_any ()
                                  in
                               if uu____5331
                               then FStar_Util.print1 "Adding %s\n" filename
                               else ());
                              (let uu____5337 =
                                 let uu____5341 =
                                   FStar_List.collect
                                     (fun uu___128_5348  ->
                                        match uu___128_5348 with
                                        | FriendImplementation m -> [m]
                                        | d -> []) dep_node.edges
                                    in
                                 FStar_List.append uu____5341 all_friends1
                                  in
                               (uu____5337, (filename :: all_files1)))))))
            
            and all_friend_deps dep_graph1 cycle all_friends filenames =
              FStar_List.fold_left
                (fun all_friends1  ->
                   fun k  ->
                     all_friend_deps_1 dep_graph1 (k :: cycle) all_friends1 k)
                all_friends filenames
             in
            (let uu____5414 = FStar_Options.debug_any ()  in
             if uu____5414
             then
               FStar_Util.print_string
                 "==============Phase1==================\n"
             else ());
            (let widened = FStar_Util.mk_ref false  in
             let widen_deps friends deps =
               let uu____5443 = deps  in
               match uu____5443 with
               | Deps dg ->
                   let uu____5447 = deps_empty ()  in
                   (match uu____5447 with
                    | Deps dg' ->
                        let widen_one deps1 =
                          FStar_All.pipe_right deps1
                            (FStar_List.map
                               (fun d  ->
                                  match d with
                                  | PreferInterface m when
                                      (FStar_List.contains m friends) &&
                                        (has_implementation file_system_map m)
                                      ->
                                      (FStar_ST.op_Colon_Equals widened true;
                                       FriendImplementation m)
                                  | uu____5519 -> d))
                           in
                        (FStar_Util.smap_fold dg
                           (fun filename  ->
                              fun dep_node  ->
                                fun uu____5527  ->
                                  let uu____5529 =
                                    let uu___133_5530 = dep_node  in
                                    let uu____5531 = widen_one dep_node.edges
                                       in
                                    { edges = uu____5531; color = White }  in
                                  FStar_Util.smap_add dg' filename uu____5529)
                           ();
                         Deps dg'))
                in
             let dep_graph1 =
               let uu____5533 = (FStar_Options.cmi ()) && for_extraction  in
               if uu____5533
               then widen_deps interfaces_needing_inlining dep_graph
               else dep_graph  in
             let uu____5538 =
               all_friend_deps dep_graph1 [] ([], []) root_files  in
             match uu____5538 with
             | (friends,all_files_0) ->
                 ((let uu____5581 = FStar_Options.debug_any ()  in
                   if uu____5581
                   then
                     let uu____5584 =
                       let uu____5586 =
                         FStar_Util.remove_dups (fun x  -> fun y  -> x = y)
                           friends
                          in
                       FStar_String.concat ", " uu____5586  in
                     FStar_Util.print3
                       "Phase1 complete:\n\tall_files = %s\n\tall_friends=%s\n\tinterfaces_with_inlining=%s\n"
                       (FStar_String.concat ", " all_files_0) uu____5584
                       (FStar_String.concat ", " interfaces_needing_inlining)
                   else ());
                  (let dep_graph2 = widen_deps friends dep_graph1  in
                   let uu____5605 =
                     (let uu____5617 = FStar_Options.debug_any ()  in
                      if uu____5617
                      then
                        FStar_Util.print_string
                          "==============Phase2==================\n"
                      else ());
                     all_friend_deps dep_graph2 [] ([], []) root_files  in
                   match uu____5605 with
                   | (uu____5640,all_files) ->
                       ((let uu____5655 = FStar_Options.debug_any ()  in
                         if uu____5655
                         then
                           FStar_Util.print1
                             "Phase2 complete: all_files = %s\n"
                             (FStar_String.concat ", " all_files)
                         else ());
                        (let uu____5662 = FStar_ST.op_Bang widened  in
                         (all_files, uu____5662))))))
  
let (collect : Prims.string Prims.list -> (Prims.string Prims.list * deps)) =
  fun all_cmd_line_files  ->
    let all_cmd_line_files1 =
      FStar_All.pipe_right all_cmd_line_files
        (FStar_List.map
           (fun fn  ->
              let uu____5754 = FStar_Options.find_file fn  in
              match uu____5754 with
              | FStar_Pervasives_Native.None  ->
                  let uu____5760 =
                    let uu____5766 =
                      FStar_Util.format1 "File %s could not be found\n" fn
                       in
                    (FStar_Errors.Fatal_ModuleOrFileNotFound, uu____5766)  in
                  FStar_Errors.raise_err uu____5760
              | FStar_Pervasives_Native.Some fn1 -> fn1))
       in
    let dep_graph = deps_empty ()  in
    let file_system_map = build_map all_cmd_line_files1  in
    let interfaces_needing_inlining = FStar_Util.mk_ref []  in
    let add_interface_for_inlining l =
      let l1 = lowercase_module_name l  in
      let uu____5796 =
        let uu____5800 = FStar_ST.op_Bang interfaces_needing_inlining  in l1
          :: uu____5800
         in
      FStar_ST.op_Colon_Equals interfaces_needing_inlining uu____5796  in
    let rec discover_one file_name =
      let uu____5907 =
        let uu____5909 = deps_try_find dep_graph file_name  in
        uu____5909 = FStar_Pervasives_Native.None  in
      if uu____5907
      then
        let uu____5915 =
          let uu____5927 =
            let uu____5941 = FStar_ST.op_Bang collect_one_cache  in
            FStar_Util.smap_try_find uu____5941 file_name  in
          match uu____5927 with
          | FStar_Pervasives_Native.Some cached -> cached
          | FStar_Pervasives_Native.None  ->
              collect_one file_system_map file_name
           in
        match uu____5915 with
        | (deps,mo_roots,needs_interface_inlining) ->
            (if needs_interface_inlining
             then add_interface_for_inlining file_name
             else ();
             (let deps1 =
                let module_name = lowercase_module_name file_name  in
                let uu____6078 =
                  (is_implementation file_name) &&
                    (has_interface file_system_map module_name)
                   in
                if uu____6078
                then FStar_List.append deps [UseInterface module_name]
                else deps  in
              let dep_node =
                let uu____6086 = FStar_List.unique deps1  in
                { edges = uu____6086; color = White }  in
              deps_add_dep dep_graph file_name dep_node;
              (let uu____6088 =
                 FStar_List.map
                   (file_of_dep file_system_map all_cmd_line_files1)
                   (FStar_List.append deps1 mo_roots)
                  in
               FStar_List.iter discover_one uu____6088)))
      else ()  in
    FStar_List.iter discover_one all_cmd_line_files1;
    (let cycle_detected dep_graph1 cycle filename =
       FStar_Util.print1
         "The cycle contains a subset of the modules in:\n%s \n"
         (FStar_String.concat "\n`used by` " cycle);
       print_graph dep_graph1;
       FStar_Util.print_string "\n";
       (let uu____6128 =
          let uu____6134 =
            FStar_Util.format1 "Recursive dependency on module %s\n" filename
             in
          (FStar_Errors.Fatal_CyclicDependence, uu____6134)  in
        FStar_Errors.raise_err uu____6128)
        in
     let full_cycle_detection all_command_line_files =
       let dep_graph1 = dep_graph_copy dep_graph  in
       let rec aux cycle filename =
         let node =
           let uu____6171 = deps_try_find dep_graph1 filename  in
           match uu____6171 with
           | FStar_Pervasives_Native.Some node -> node
           | FStar_Pervasives_Native.None  ->
               let uu____6175 =
                 FStar_Util.format1 "Failed to find dependences of %s"
                   filename
                  in
               failwith uu____6175
            in
         let direct_deps =
           FStar_All.pipe_right node.edges
             (FStar_List.collect
                (fun x  ->
                   match x with
                   | UseInterface f ->
                       let uu____6189 = implementation_of file_system_map f
                          in
                       (match uu____6189 with
                        | FStar_Pervasives_Native.None  -> [x]
                        | FStar_Pervasives_Native.Some fn when fn = filename
                            -> [x]
                        | uu____6200 -> [x; UseImplementation f])
                   | PreferInterface f ->
                       let uu____6206 = implementation_of file_system_map f
                          in
                       (match uu____6206 with
                        | FStar_Pervasives_Native.None  -> [x]
                        | FStar_Pervasives_Native.Some fn when fn = filename
                            -> [x]
                        | uu____6217 -> [x; UseImplementation f])
                   | uu____6221 -> [x]))
            in
         match node.color with
         | Gray  -> cycle_detected dep_graph1 cycle filename
         | Black  -> ()
         | White  ->
             (deps_add_dep dep_graph1 filename
                (let uu___134_6224 = node  in
                 { edges = direct_deps; color = Gray });
              (let uu____6226 =
                 dependences_of file_system_map dep_graph1
                   all_command_line_files filename
                  in
               FStar_List.iter (fun k  -> aux (k :: cycle) k) uu____6226);
              deps_add_dep dep_graph1 filename
                (let uu___135_6236 = node  in
                 { edges = direct_deps; color = Black }))
          in
       FStar_List.iter (aux []) all_command_line_files  in
     full_cycle_detection all_cmd_line_files1;
     FStar_All.pipe_right all_cmd_line_files1
       (FStar_List.iter
          (fun f  ->
             let m = lowercase_module_name f  in
             FStar_Options.add_verify_module m));
     (let inlining_ifaces = FStar_ST.op_Bang interfaces_needing_inlining  in
      let uu____6302 =
        let uu____6311 =
          let uu____6313 = FStar_Options.codegen ()  in
          uu____6313 <> FStar_Pervasives_Native.None  in
        topological_dependences_of file_system_map dep_graph inlining_ifaces
          all_cmd_line_files1 uu____6311
         in
      match uu____6302 with
      | (all_files,uu____6326) ->
          ((let uu____6336 = FStar_Options.debug_any ()  in
            if uu____6336
            then
              FStar_Util.print1 "Interfaces needing inlining: %s\n"
                (FStar_String.concat ", " inlining_ifaces)
            else ());
           (all_files,
             (mk_deps dep_graph file_system_map all_cmd_line_files1 all_files
                inlining_ifaces)))))
  
let (deps_of : deps -> Prims.string -> Prims.string Prims.list) =
  fun deps  ->
    fun f  ->
      dependences_of deps.file_system_map deps.dep_graph deps.cmd_line_files
        f
  
let (hash_dependences :
  deps ->
    Prims.string ->
      Prims.string ->
        (Prims.string * Prims.string) Prims.list
          FStar_Pervasives_Native.option)
  =
  fun deps  ->
    fun fn  ->
      fun cache_file  ->
        let file_system_map = deps.file_system_map  in
        let all_cmd_line_files = deps.cmd_line_files  in
        let deps1 = deps.dep_graph  in
        let fn1 =
          let uu____6403 = FStar_Options.find_file fn  in
          match uu____6403 with
          | FStar_Pervasives_Native.Some fn1 -> fn1
          | uu____6411 -> fn  in
        let digest_of_file1 fn2 =
          (let uu____6425 = FStar_Options.debug_any ()  in
           if uu____6425
           then
             FStar_Util.print2 "%s: contains digest of %s\n" cache_file fn2
           else ());
          FStar_Util.digest_of_file fn2  in
        let module_name = lowercase_module_name fn1  in
        let source_hash = digest_of_file1 fn1  in
        let interface_hash =
          let uu____6444 =
            (is_implementation fn1) &&
              (has_interface file_system_map module_name)
             in
          if uu____6444
          then
            let uu____6455 =
              let uu____6462 =
                let uu____6464 =
                  let uu____6466 = interface_of file_system_map module_name
                     in
                  FStar_Option.get uu____6466  in
                digest_of_file1 uu____6464  in
              ("interface", uu____6462)  in
            [uu____6455]
          else []  in
        let binary_deps =
          let uu____6498 =
            dependences_of file_system_map deps1 all_cmd_line_files fn1  in
          FStar_All.pipe_right uu____6498
            (FStar_List.filter
               (fun fn2  ->
                  let uu____6513 =
                    (is_interface fn2) &&
                      (let uu____6516 = lowercase_module_name fn2  in
                       uu____6516 = module_name)
                     in
                  Prims.op_Negation uu____6513))
           in
        let binary_deps1 =
          FStar_List.sortWith
            (fun fn11  ->
               fun fn2  ->
                 let uu____6532 = lowercase_module_name fn11  in
                 let uu____6534 = lowercase_module_name fn2  in
                 FStar_String.compare uu____6532 uu____6534) binary_deps
           in
        let rec hash_deps out uu___129_6567 =
          match uu___129_6567 with
          | [] ->
              FStar_Pervasives_Native.Some
                (FStar_List.append (("source", source_hash) ::
                   interface_hash) out)
          | fn2::deps2 ->
              let cache_fn = cache_file_name fn2  in
              let digest =
                if FStar_Util.file_exists cache_fn
                then
                  let uu____6630 = digest_of_file1 fn2  in
                  FStar_Pervasives_Native.Some uu____6630
                else FStar_Pervasives_Native.None  in
              (match digest with
               | FStar_Pervasives_Native.None  ->
                   ((let uu____6648 = FStar_Options.debug_any ()  in
                     if uu____6648
                     then
                       let uu____6651 = FStar_Util.basename cache_fn  in
                       FStar_Util.print2 "%s: missed digest of file %s\n"
                         cache_file uu____6651
                     else ());
                    FStar_Pervasives_Native.None)
               | FStar_Pervasives_Native.Some dig ->
                   let uu____6667 =
                     let uu____6676 =
                       let uu____6683 = lowercase_module_name fn2  in
                       (uu____6683, dig)  in
                     uu____6676 :: out  in
                   hash_deps uu____6667 deps2)
           in
        hash_deps [] binary_deps1
  
let (print_digest : (Prims.string * Prims.string) Prims.list -> Prims.string)
  =
  fun dig  ->
    let uu____6723 =
      FStar_All.pipe_right dig
        (FStar_List.map
           (fun uu____6749  ->
              match uu____6749 with
              | (m,d) ->
                  let uu____6763 = FStar_Util.base64_encode d  in
                  FStar_Util.format2 "%s:%s" m uu____6763))
       in
    FStar_All.pipe_right uu____6723 (FStar_String.concat "\n")
  
let (print_make : deps -> unit) =
  fun deps  ->
    let file_system_map = deps.file_system_map  in
    let all_cmd_line_files = deps.cmd_line_files  in
    let deps1 = deps.dep_graph  in
    let keys = deps_keys deps1  in
    FStar_All.pipe_right keys
      (FStar_List.iter
         (fun f  ->
            let dep_node =
              let uu____6798 = deps_try_find deps1 f  in
              FStar_All.pipe_right uu____6798 FStar_Option.get  in
            let files =
              FStar_List.map (file_of_dep file_system_map all_cmd_line_files)
                dep_node.edges
               in
            let files1 =
              FStar_List.map (fun s  -> FStar_Util.replace_chars s 32 "\\ ")
                files
               in
            FStar_Util.print2 "%s: %s\n\n" f (FStar_String.concat " " files1)))
  
let (print_raw : deps -> unit) =
  fun deps  ->
    let uu____6827 = deps.dep_graph  in
    match uu____6827 with
    | Deps deps1 ->
        let uu____6831 =
          let uu____6833 =
            FStar_Util.smap_fold deps1
              (fun k  ->
                 fun dep_node  ->
                   fun out  ->
                     let uu____6851 =
                       let uu____6853 =
                         let uu____6855 =
                           FStar_List.map dep_to_string dep_node.edges  in
                         FStar_All.pipe_right uu____6855
                           (FStar_String.concat ";\n\t")
                          in
                       FStar_Util.format2 "%s -> [\n\t%s\n] " k uu____6853
                        in
                     uu____6851 :: out) []
             in
          FStar_All.pipe_right uu____6833 (FStar_String.concat ";;\n")  in
        FStar_All.pipe_right uu____6831 FStar_Util.print_endline
  
let (print_full : deps -> unit) =
  fun deps  ->
    let sort_output_files orig_output_file_map =
      let order = FStar_Util.mk_ref []  in
      let remaining_output_files = FStar_Util.smap_copy orig_output_file_map
         in
      let visited_other_modules =
        FStar_Util.smap_create (Prims.parse_int "41")  in
      let should_visit lc_module_name =
        (let uu____6927 =
           FStar_Util.smap_try_find remaining_output_files lc_module_name  in
         FStar_Option.isSome uu____6927) ||
          (let uu____6934 =
             FStar_Util.smap_try_find visited_other_modules lc_module_name
              in
           FStar_Option.isNone uu____6934)
         in
      let mark_visiting lc_module_name =
        let ml_file_opt =
          FStar_Util.smap_try_find remaining_output_files lc_module_name  in
        FStar_Util.smap_remove remaining_output_files lc_module_name;
        FStar_Util.smap_add visited_other_modules lc_module_name true;
        ml_file_opt  in
      let emit_output_file_opt ml_file_opt =
        match ml_file_opt with
        | FStar_Pervasives_Native.None  -> ()
        | FStar_Pervasives_Native.Some ml_file ->
            let uu____6977 =
              let uu____6981 = FStar_ST.op_Bang order  in ml_file ::
                uu____6981
               in
            FStar_ST.op_Colon_Equals order uu____6977
         in
      let rec aux uu___130_7088 =
        match uu___130_7088 with
        | [] -> ()
        | lc_module_name::modules_to_extract ->
            let visit_file file_opt =
              match file_opt with
              | FStar_Pervasives_Native.None  -> ()
              | FStar_Pervasives_Native.Some file_name ->
                  let uu____7116 = deps_try_find deps.dep_graph file_name  in
                  (match uu____7116 with
                   | FStar_Pervasives_Native.None  ->
                       let uu____7119 =
                         FStar_Util.format2
                           "Impossible: module %s: %s not found"
                           lc_module_name file_name
                          in
                       failwith uu____7119
                   | FStar_Pervasives_Native.Some
                       { edges = immediate_deps; color = uu____7123;_} ->
                       let immediate_deps1 =
                         FStar_List.map
                           (fun x  ->
                              FStar_String.lowercase (module_name_of_dep x))
                           immediate_deps
                          in
                       aux immediate_deps1)
               in
            ((let uu____7132 = should_visit lc_module_name  in
              if uu____7132
              then
                let ml_file_opt = mark_visiting lc_module_name  in
                ((let uu____7140 =
                    implementation_of deps.file_system_map lc_module_name  in
                  visit_file uu____7140);
                 (let uu____7145 =
                    interface_of deps.file_system_map lc_module_name  in
                  visit_file uu____7145);
                 emit_output_file_opt ml_file_opt)
              else ());
             aux modules_to_extract)
         in
      let all_extracted_modules = FStar_Util.smap_keys orig_output_file_map
         in
      aux all_extracted_modules;
      (let uu____7157 = FStar_ST.op_Bang order  in FStar_List.rev uu____7157)
       in
    let keys = deps_keys deps.dep_graph  in
    let output_file ext fst_file =
      let ml_base_name =
        let uu____7231 =
          let uu____7233 =
            let uu____7237 = FStar_Util.basename fst_file  in
            check_and_strip_suffix uu____7237  in
          FStar_Option.get uu____7233  in
        FStar_Util.replace_chars uu____7231 46 "_"  in
      FStar_Options.prepend_output_dir (Prims.strcat ml_base_name ext)  in
    let norm_path s = FStar_Util.replace_chars s 92 "/"  in
    let output_ml_file f =
      let uu____7262 = output_file ".ml" f  in norm_path uu____7262  in
    let output_krml_file f =
      let uu____7274 = output_file ".krml" f  in norm_path uu____7274  in
    let output_cmx_file f =
      let uu____7286 = output_file ".cmx" f  in norm_path uu____7286  in
    let cache_file f =
      let uu____7298 = cache_file_name f  in norm_path uu____7298  in
    let transitive_krml = FStar_Util.smap_create (Prims.parse_int "41")  in
    FStar_All.pipe_right keys
      (FStar_List.iter
         (fun file_name  ->
            let dep_node =
              let uu____7357 = deps_try_find deps.dep_graph file_name  in
              FStar_All.pipe_right uu____7357 FStar_Option.get  in
            let iface_deps =
              let uu____7367 = is_interface file_name  in
              if uu____7367
              then FStar_Pervasives_Native.None
              else
                (let uu____7378 =
                   let uu____7382 = lowercase_module_name file_name  in
                   interface_of deps.file_system_map uu____7382  in
                 match uu____7378 with
                 | FStar_Pervasives_Native.None  ->
                     FStar_Pervasives_Native.None
                 | FStar_Pervasives_Native.Some iface ->
                     let uu____7394 =
                       let uu____7397 =
                         let uu____7398 = deps_try_find deps.dep_graph iface
                            in
                         FStar_Option.get uu____7398  in
                       uu____7397.edges  in
                     FStar_Pervasives_Native.Some uu____7394)
               in
            let iface_deps1 =
              FStar_Util.map_opt iface_deps
                (FStar_List.filter
                   (fun iface_dep  ->
                      let uu____7415 =
                        FStar_Util.for_some (dep_subsumed_by iface_dep)
                          dep_node.edges
                         in
                      Prims.op_Negation uu____7415))
               in
            let norm_f = norm_path file_name  in
            let files =
              FStar_List.map
                (file_of_dep_aux true deps.file_system_map
                   deps.cmd_line_files) dep_node.edges
               in
            let files1 =
              match iface_deps1 with
              | FStar_Pervasives_Native.None  -> files
              | FStar_Pervasives_Native.Some iface_deps2 ->
                  let iface_files =
                    FStar_List.map
                      (file_of_dep_aux true deps.file_system_map
                         deps.cmd_line_files) iface_deps2
                     in
                  FStar_Util.remove_dups (fun x  -> fun y  -> x = y)
                    (FStar_List.append files iface_files)
               in
            let files2 = FStar_List.map norm_path files1  in
            let files3 =
              FStar_List.map (fun s  -> FStar_Util.replace_chars s 32 "\\ ")
                files2
               in
            let files4 = FStar_String.concat "\\\n\t" files3  in
            (let uu____7475 = cache_file file_name  in
             FStar_Util.print3 "%s: %s \\\n\t%s\n\n" uu____7475 norm_f files4);
            (let already_there =
               let uu____7482 =
                 let uu____7496 =
                   let uu____7498 = output_file ".krml" file_name  in
                   norm_path uu____7498  in
                 FStar_Util.smap_try_find transitive_krml uu____7496  in
               match uu____7482 with
               | FStar_Pervasives_Native.Some
                   (uu____7515,already_there,uu____7517) -> already_there
               | FStar_Pervasives_Native.None  -> []  in
             (let uu____7552 =
                let uu____7554 = output_file ".krml" file_name  in
                norm_path uu____7554  in
              let uu____7557 =
                let uu____7569 =
                  let uu____7571 = output_file ".exe" file_name  in
                  norm_path uu____7571  in
                let uu____7574 =
                  let uu____7578 =
                    let uu____7582 =
                      let uu____7586 = deps_of deps file_name  in
                      FStar_List.map
                        (fun x  ->
                           let uu____7596 = output_file ".krml" x  in
                           norm_path uu____7596) uu____7586
                       in
                    FStar_List.append already_there uu____7582  in
                  FStar_List.unique uu____7578  in
                (uu____7569, uu____7574, false)  in
              FStar_Util.smap_add transitive_krml uu____7552 uu____7557);
             (let uu____7618 =
                let uu____7627 = FStar_Options.cmi ()  in
                if uu____7627
                then
                  topological_dependences_of deps.file_system_map
                    deps.dep_graph deps.interfaces_with_inlining [file_name]
                    true
                else
                  (let maybe_widen_deps f_deps =
                     FStar_List.map
                       (fun dep1  ->
                          file_of_dep_aux false deps.file_system_map
                            deps.cmd_line_files dep1) f_deps
                      in
                   let fst_files = maybe_widen_deps dep_node.edges  in
                   let fst_files_from_iface =
                     match iface_deps1 with
                     | FStar_Pervasives_Native.None  -> []
                     | FStar_Pervasives_Native.Some iface_deps2 ->
                         maybe_widen_deps iface_deps2
                      in
                   let uu____7675 =
                     FStar_Util.remove_dups (fun x  -> fun y  -> x = y)
                       (FStar_List.append fst_files fst_files_from_iface)
                      in
                   (uu____7675, false))
                 in
              match uu____7618 with
              | (all_fst_files_dep,widened) ->
                  let all_checked_fst_files =
                    FStar_List.map cache_file all_fst_files_dep  in
                  let uu____7709 = is_implementation file_name  in
                  if uu____7709
                  then
                    ((let uu____7713 = (FStar_Options.cmi ()) && widened  in
                      if uu____7713
                      then
                        ((let uu____7717 = output_ml_file file_name  in
                          let uu____7719 = cache_file file_name  in
                          FStar_Util.print3 "%s: %s \\\n\t%s\n\n" uu____7717
                            uu____7719
                            (FStar_String.concat " \\\n\t"
                               all_checked_fst_files));
                         (let uu____7723 = output_krml_file file_name  in
                          let uu____7725 = cache_file file_name  in
                          FStar_Util.print3 "%s: %s \\\n\t%s\n\n" uu____7723
                            uu____7725
                            (FStar_String.concat " \\\n\t"
                               all_checked_fst_files)))
                      else
                        ((let uu____7732 = output_ml_file file_name  in
                          let uu____7734 = cache_file file_name  in
                          FStar_Util.print2 "%s: %s \n\n" uu____7732
                            uu____7734);
                         (let uu____7737 = output_krml_file file_name  in
                          let uu____7739 = cache_file file_name  in
                          FStar_Util.print2 "%s: %s\n\n" uu____7737
                            uu____7739)));
                     (let cmx_files =
                        let extracted_fst_files =
                          FStar_All.pipe_right all_fst_files_dep
                            (FStar_List.filter
                               (fun df  ->
                                  (let uu____7764 = lowercase_module_name df
                                      in
                                   let uu____7766 =
                                     lowercase_module_name file_name  in
                                   uu____7764 <> uu____7766) &&
                                    (let uu____7770 =
                                       lowercase_module_name df  in
                                     FStar_Options.should_extract uu____7770)))
                           in
                        FStar_All.pipe_right extracted_fst_files
                          (FStar_List.map output_cmx_file)
                         in
                      let uu____7780 =
                        let uu____7782 = lowercase_module_name file_name  in
                        FStar_Options.should_extract uu____7782  in
                      if uu____7780
                      then
                        let uu____7785 = output_cmx_file file_name  in
                        let uu____7787 = output_ml_file file_name  in
                        FStar_Util.print3 "%s: %s \\\n\t%s\n\n" uu____7785
                          uu____7787 (FStar_String.concat "\\\n\t" cmx_files)
                      else ()))
                  else
                    (let uu____7795 =
                       (let uu____7799 =
                          let uu____7801 = lowercase_module_name file_name
                             in
                          has_implementation deps.file_system_map uu____7801
                           in
                        Prims.op_Negation uu____7799) &&
                         (is_interface file_name)
                        in
                     if uu____7795
                     then
                       let uu____7804 = (FStar_Options.cmi ()) && widened  in
                       (if uu____7804
                        then
                          let uu____7807 = output_krml_file file_name  in
                          let uu____7809 = cache_file file_name  in
                          FStar_Util.print3 "%s: %s \\\n\t%s\n\n" uu____7807
                            uu____7809
                            (FStar_String.concat " \\\n\t"
                               all_checked_fst_files)
                        else
                          (let uu____7815 = output_krml_file file_name  in
                           let uu____7817 = cache_file file_name  in
                           FStar_Util.print2 "%s: %s \n\n" uu____7815
                             uu____7817))
                     else ())))));
    (let all_fst_files =
       let uu____7826 =
         FStar_All.pipe_right keys (FStar_List.filter is_implementation)  in
       FStar_All.pipe_right uu____7826
         (FStar_Util.sort_with FStar_String.compare)
        in
     let all_ml_files =
       let ml_file_map = FStar_Util.smap_create (Prims.parse_int "41")  in
       FStar_All.pipe_right all_fst_files
         (FStar_List.iter
            (fun fst_file  ->
               let mname = lowercase_module_name fst_file  in
               let uu____7867 = FStar_Options.should_extract mname  in
               if uu____7867
               then
                 let uu____7870 = output_ml_file fst_file  in
                 FStar_Util.smap_add ml_file_map mname uu____7870
               else ()));
       sort_output_files ml_file_map  in
     let all_krml_files =
       let krml_file_map = FStar_Util.smap_create (Prims.parse_int "41")  in
       FStar_All.pipe_right keys
         (FStar_List.iter
            (fun fst_file  ->
               let mname = lowercase_module_name fst_file  in
               let uu____7897 = output_krml_file fst_file  in
               FStar_Util.smap_add krml_file_map mname uu____7897));
       sort_output_files krml_file_map  in
     let rec make_transitive f =
       let uu____7916 =
         let uu____7928 = FStar_Util.smap_try_find transitive_krml f  in
         FStar_Util.must uu____7928  in
       match uu____7916 with
       | (exe,deps1,seen) ->
           if seen
           then (exe, deps1)
           else
             (FStar_Util.smap_add transitive_krml f (exe, deps1, true);
              (let deps2 =
                 let uu____8022 =
                   let uu____8026 =
                     FStar_List.map
                       (fun dep1  ->
                          let uu____8042 = make_transitive dep1  in
                          match uu____8042 with
                          | (uu____8054,deps2) -> dep1 :: deps2) deps1
                      in
                   FStar_List.flatten uu____8026  in
                 FStar_List.unique uu____8022  in
               FStar_Util.smap_add transitive_krml f (exe, deps2, true);
               (exe, deps2)))
        in
     (let uu____8090 = FStar_Util.smap_keys transitive_krml  in
      FStar_List.iter
        (fun f  ->
           let uu____8115 = make_transitive f  in
           match uu____8115 with
           | (exe,deps1) ->
               let deps2 =
                 let uu____8136 = FStar_List.unique (f :: deps1)  in
                 FStar_String.concat " " uu____8136  in
               let wasm =
                 let uu____8145 =
                   FStar_Util.substring exe (Prims.parse_int "0")
                     ((FStar_String.length exe) - (Prims.parse_int "4"))
                    in
                 Prims.strcat uu____8145 ".wasm"  in
               (FStar_Util.print2 "%s: %s\n\n" exe deps2;
                FStar_Util.print2 "%s: %s\n\n" wasm deps2)) uu____8090);
     (let uu____8154 =
        let uu____8156 =
          FStar_All.pipe_right all_fst_files (FStar_List.map norm_path)  in
        FStar_All.pipe_right uu____8156 (FStar_String.concat " \\\n\t")  in
      FStar_Util.print1 "ALL_FST_FILES=\\\n\t%s\n\n" uu____8154);
     (let uu____8175 =
        let uu____8177 =
          FStar_All.pipe_right all_ml_files (FStar_List.map norm_path)  in
        FStar_All.pipe_right uu____8177 (FStar_String.concat " \\\n\t")  in
      FStar_Util.print1 "ALL_ML_FILES=\\\n\t%s\n\n" uu____8175);
     (let uu____8195 =
        let uu____8197 =
          FStar_All.pipe_right all_krml_files (FStar_List.map norm_path)  in
        FStar_All.pipe_right uu____8197 (FStar_String.concat " \\\n\t")  in
      FStar_Util.print1 "ALL_KRML_FILES=\\\n\t%s\n" uu____8195))
  
let (print : deps -> unit) =
  fun deps  ->
    let uu____8221 = FStar_Options.dep ()  in
    match uu____8221 with
    | FStar_Pervasives_Native.Some "make" -> print_make deps
    | FStar_Pervasives_Native.Some "full" -> print_full deps
    | FStar_Pervasives_Native.Some "graph" -> print_graph deps.dep_graph
    | FStar_Pervasives_Native.Some "raw" -> print_raw deps
    | FStar_Pervasives_Native.Some uu____8233 ->
        FStar_Errors.raise_err
          (FStar_Errors.Fatal_UnknownToolForDep, "unknown tool for --dep\n")
    | FStar_Pervasives_Native.None  -> ()
  
let (print_fsmap :
  (Prims.string FStar_Pervasives_Native.option * Prims.string
    FStar_Pervasives_Native.option) FStar_Util.smap -> Prims.string)
  =
  fun fsmap  ->
    FStar_Util.smap_fold fsmap
      (fun k  ->
         fun uu____8288  ->
           fun s  ->
             match uu____8288 with
             | (v0,v1) ->
                 let uu____8317 =
                   let uu____8319 =
                     FStar_Util.format3 "%s -> (%s, %s)" k
                       (FStar_Util.dflt "_" v0) (FStar_Util.dflt "_" v1)
                      in
                   Prims.strcat "; " uu____8319  in
                 Prims.strcat s uu____8317) ""
  
let (module_has_interface : deps -> FStar_Ident.lident -> Prims.bool) =
  fun deps  ->
    fun module_name  ->
      let uu____8340 =
        let uu____8342 = FStar_Ident.string_of_lid module_name  in
        FStar_String.lowercase uu____8342  in
      has_interface deps.file_system_map uu____8340
  
let (deps_has_implementation : deps -> FStar_Ident.lident -> Prims.bool) =
  fun deps  ->
    fun module_name  ->
      let m =
        let uu____8358 = FStar_Ident.string_of_lid module_name  in
        FStar_String.lowercase uu____8358  in
      FStar_All.pipe_right deps.all_files
        (FStar_Util.for_some
           (fun f  ->
              (is_implementation f) &&
                (let uu____8369 =
                   let uu____8371 = module_name_of_file f  in
                   FStar_String.lowercase uu____8371  in
                 uu____8369 = m)))
  