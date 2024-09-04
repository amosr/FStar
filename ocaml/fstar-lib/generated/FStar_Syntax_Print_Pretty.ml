open Prims
let (rfrac : FStar_BaseTypes.float) =
  FStar_Compiler_Util.float_of_string "1.0"
let (width : Prims.int) = (Prims.of_int (100))
let (pp : FStar_Pprint.document -> Prims.string) =
  fun d -> FStar_Pprint.pretty_string rfrac width d
let (term_to_doc' :
  FStar_Syntax_DsEnv.env -> FStar_Syntax_Syntax.term -> FStar_Pprint.document)
  =
  fun env ->
    fun tm ->
      FStar_GenSym.with_frozen_gensym
        (fun uu___ ->
           let e = FStar_Syntax_Resugar.resugar_term' env tm in
           FStar_Parser_ToDocument.term_to_document e)
let (univ_to_doc' :
  FStar_Syntax_DsEnv.env ->
    FStar_Syntax_Syntax.universe -> FStar_Pprint.document)
  =
  fun env ->
    fun u ->
      FStar_GenSym.with_frozen_gensym
        (fun uu___ ->
           let e =
             FStar_Syntax_Resugar.resugar_universe' env u
               FStar_Compiler_Range_Type.dummyRange in
           FStar_Parser_ToDocument.term_to_document e)
let (term_to_string' :
  FStar_Syntax_DsEnv.env -> FStar_Syntax_Syntax.term -> Prims.string) =
  fun env ->
    fun tm ->
      FStar_GenSym.with_frozen_gensym
        (fun uu___ -> let d = term_to_doc' env tm in pp d)
let (univ_to_string' :
  FStar_Syntax_DsEnv.env -> FStar_Syntax_Syntax.universe -> Prims.string) =
  fun env ->
    fun u ->
      FStar_GenSym.with_frozen_gensym
        (fun uu___ -> let d = univ_to_doc' env u in pp d)
let (comp_to_doc' :
  FStar_Syntax_DsEnv.env -> FStar_Syntax_Syntax.comp -> FStar_Pprint.document)
  =
  fun env ->
    fun c ->
      FStar_GenSym.with_frozen_gensym
        (fun uu___ ->
           let e = FStar_Syntax_Resugar.resugar_comp' env c in
           FStar_Parser_ToDocument.term_to_document e)
let (comp_to_string' :
  FStar_Syntax_DsEnv.env -> FStar_Syntax_Syntax.comp -> Prims.string) =
  fun env ->
    fun c ->
      FStar_GenSym.with_frozen_gensym
        (fun uu___ -> let d = comp_to_doc' env c in pp d)
let (sigelt_to_doc' :
  FStar_Syntax_DsEnv.env ->
    FStar_Syntax_Syntax.sigelt -> FStar_Pprint.document)
  =
  fun env ->
    fun se ->
      FStar_GenSym.with_frozen_gensym
        (fun uu___ ->
           let uu___1 = FStar_Syntax_Resugar.resugar_sigelt' env se in
           match uu___1 with
           | FStar_Pervasives_Native.None -> FStar_Pprint.empty
           | FStar_Pervasives_Native.Some d ->
               FStar_Parser_ToDocument.decl_to_document d)
let (sigelt_to_string' :
  FStar_Syntax_DsEnv.env -> FStar_Syntax_Syntax.sigelt -> Prims.string) =
  fun env ->
    fun se ->
      FStar_GenSym.with_frozen_gensym
        (fun uu___ -> let d = sigelt_to_doc' env se in pp d)
let (term_to_doc : FStar_Syntax_Syntax.term -> FStar_Pprint.document) =
  fun tm ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ ->
         let e = FStar_Syntax_Resugar.resugar_term tm in
         FStar_Parser_ToDocument.term_to_document e)
let (univ_to_doc : FStar_Syntax_Syntax.universe -> FStar_Pprint.document) =
  fun u ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ ->
         let e =
           FStar_Syntax_Resugar.resugar_universe u
             FStar_Compiler_Range_Type.dummyRange in
         FStar_Parser_ToDocument.term_to_document e)
let (comp_to_doc : FStar_Syntax_Syntax.comp -> FStar_Pprint.document) =
  fun c ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ ->
         let e = FStar_Syntax_Resugar.resugar_comp c in
         FStar_Parser_ToDocument.term_to_document e)
let (sigelt_to_doc : FStar_Syntax_Syntax.sigelt -> FStar_Pprint.document) =
  fun se ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ ->
         let uu___1 = FStar_Syntax_Resugar.resugar_sigelt se in
         match uu___1 with
         | FStar_Pervasives_Native.None -> FStar_Pprint.empty
         | FStar_Pervasives_Native.Some d ->
             FStar_Parser_ToDocument.decl_to_document d)
let (term_to_string : FStar_Syntax_Syntax.term -> Prims.string) =
  fun tm ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ -> let d = term_to_doc tm in pp d)
let (comp_to_string : FStar_Syntax_Syntax.comp -> Prims.string) =
  fun c ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ ->
         let e = FStar_Syntax_Resugar.resugar_comp c in
         let d = FStar_Parser_ToDocument.term_to_document e in pp d)
let (sigelt_to_string : FStar_Syntax_Syntax.sigelt -> Prims.string) =
  fun se ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ ->
         let uu___1 = FStar_Syntax_Resugar.resugar_sigelt se in
         match uu___1 with
         | FStar_Pervasives_Native.None -> ""
         | FStar_Pervasives_Native.Some d ->
             let d1 = FStar_Parser_ToDocument.decl_to_document d in pp d1)
let (univ_to_string : FStar_Syntax_Syntax.universe -> Prims.string) =
  fun u ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ ->
         let e =
           FStar_Syntax_Resugar.resugar_universe u
             FStar_Compiler_Range_Type.dummyRange in
         let d = FStar_Parser_ToDocument.term_to_document e in pp d)
let (tscheme_to_string : FStar_Syntax_Syntax.tscheme -> Prims.string) =
  fun ts ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ ->
         let d = FStar_Syntax_Resugar.resugar_tscheme ts in
         let d1 = FStar_Parser_ToDocument.decl_to_document d in pp d1)
let (pat_to_string : FStar_Syntax_Syntax.pat -> Prims.string) =
  fun p ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ ->
         let e =
           let uu___1 =
             Obj.magic
               (FStar_Class_Setlike.empty ()
                  (Obj.magic
                     (FStar_Compiler_FlatSet.setlike_flat_set
                        FStar_Syntax_Syntax.ord_bv)) ()) in
           FStar_Syntax_Resugar.resugar_pat p uu___1 in
         let d = FStar_Parser_ToDocument.pat_to_document e in pp d)
let (binder_to_string' :
  Prims.bool -> FStar_Syntax_Syntax.binder -> Prims.string) =
  fun is_arrow ->
    fun b ->
      FStar_GenSym.with_frozen_gensym
        (fun uu___ ->
           let uu___1 =
             FStar_Syntax_Resugar.resugar_binder b
               FStar_Compiler_Range_Type.dummyRange in
           match uu___1 with
           | FStar_Pervasives_Native.None -> ""
           | FStar_Pervasives_Native.Some e ->
               let d = FStar_Parser_ToDocument.binder_to_document e in pp d)
let (eff_decl_to_string : FStar_Syntax_Syntax.eff_decl -> Prims.string) =
  fun ed ->
    FStar_GenSym.with_frozen_gensym
      (fun uu___ ->
         let d = FStar_Syntax_Resugar.resugar_eff_decl ed in
         let d1 = FStar_Parser_ToDocument.decl_to_document d in pp d1)