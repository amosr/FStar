open Prims
let (run_tactic_on_typ :
  FStar_Compiler_Range.range ->
    FStar_Compiler_Range.range ->
      FStar_Syntax_Syntax.term ->
        FStar_TypeChecker_Env.env ->
          FStar_Syntax_Syntax.term ->
            (FStar_Tactics_Types.goal Prims.list * FStar_Syntax_Syntax.term))
  =
  fun rng_tac ->
    fun rng_goal ->
      fun tactic ->
        fun env ->
          fun typ ->
            let rng =
              let uu___ = FStar_Compiler_Range.use_range rng_goal in
              let uu___1 = FStar_Compiler_Range.use_range rng_tac in
              FStar_Compiler_Range.range_of_rng uu___ uu___1 in
            let uu___ = FStar_Tactics_Basic.proofstate_of_goal_ty rng env typ in
            match uu___ with
            | (ps, w) ->
                let uu___1 =
                  FStar_Tactics_Interpreter.run_tactic_on_ps rng_tac rng_goal
                    false FStar_Syntax_Embeddings.e_unit ()
                    FStar_Syntax_Embeddings.e_unit tactic ps in
                (match uu___1 with | (gs, _res) -> (gs, w))
let (run_tactic_on_all_implicits :
  FStar_Compiler_Range.range ->
    FStar_Compiler_Range.range ->
      FStar_Syntax_Syntax.term ->
        FStar_TypeChecker_Env.env ->
          FStar_TypeChecker_Env.implicits ->
            FStar_Tactics_Types.goal Prims.list)
  =
  fun rng_tac ->
    fun rng_goal ->
      fun tactic ->
        fun env ->
          fun imps ->
            let uu___ =
              FStar_Tactics_Basic.proofstate_of_all_implicits rng_goal env
                imps in
            match uu___ with
            | (ps, uu___1) ->
                let uu___2 =
                  let uu___3 = FStar_TypeChecker_Env.get_range env in
                  FStar_Tactics_Interpreter.run_tactic_on_ps uu___3 rng_goal
                    true FStar_Syntax_Embeddings.e_unit ()
                    FStar_Syntax_Embeddings.e_unit tactic ps in
                (match uu___2 with | (goals, ()) -> goals)
type pol =
  | StrictlyPositive 
  | Pos 
  | Neg 
  | Both 
let (uu___is_StrictlyPositive : pol -> Prims.bool) =
  fun projectee ->
    match projectee with | StrictlyPositive -> true | uu___ -> false
let (uu___is_Pos : pol -> Prims.bool) =
  fun projectee -> match projectee with | Pos -> true | uu___ -> false
let (uu___is_Neg : pol -> Prims.bool) =
  fun projectee -> match projectee with | Neg -> true | uu___ -> false
let (uu___is_Both : pol -> Prims.bool) =
  fun projectee -> match projectee with | Both -> true | uu___ -> false
type 'a tres_m =
  | Unchanged of 'a 
  | Simplified of ('a * FStar_Tactics_Types.goal Prims.list) 
  | Dual of ('a * 'a * FStar_Tactics_Types.goal Prims.list) 
let uu___is_Unchanged : 'a . 'a tres_m -> Prims.bool =
  fun projectee ->
    match projectee with | Unchanged _0 -> true | uu___ -> false
let __proj__Unchanged__item___0 : 'a . 'a tres_m -> 'a =
  fun projectee -> match projectee with | Unchanged _0 -> _0
let uu___is_Simplified : 'a . 'a tres_m -> Prims.bool =
  fun projectee ->
    match projectee with | Simplified _0 -> true | uu___ -> false
let __proj__Simplified__item___0 :
  'a . 'a tres_m -> ('a * FStar_Tactics_Types.goal Prims.list) =
  fun projectee -> match projectee with | Simplified _0 -> _0
let uu___is_Dual : 'a . 'a tres_m -> Prims.bool =
  fun projectee -> match projectee with | Dual _0 -> true | uu___ -> false
let __proj__Dual__item___0 :
  'a . 'a tres_m -> ('a * 'a * FStar_Tactics_Types.goal Prims.list) =
  fun projectee -> match projectee with | Dual _0 -> _0
type tres = FStar_Syntax_Syntax.term tres_m
let tpure : 'uuuuu . 'uuuuu -> 'uuuuu tres_m = fun x -> Unchanged x
let (flip : pol -> pol) =
  fun p ->
    match p with
    | StrictlyPositive -> Neg
    | Pos -> Neg
    | Neg -> Pos
    | Both -> Both
let (getprop :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun e ->
    fun t ->
      let tn =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Weak;
          FStar_TypeChecker_Env.HNF;
          FStar_TypeChecker_Env.UnfoldUntil
            FStar_Syntax_Syntax.delta_constant] e t in
      FStar_Syntax_Util.un_squash tn
let (by_tactic_interp :
  pol -> FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> tres) =
  fun pol1 ->
    fun e ->
      fun t ->
        let uu___ = FStar_Syntax_Util.head_and_args t in
        match uu___ with
        | (hd, args) ->
            let uu___1 =
              let uu___2 =
                let uu___3 = FStar_Syntax_Util.un_uinst hd in
                uu___3.FStar_Syntax_Syntax.n in
              (uu___2, args) in
            (match uu___1 with
             | (FStar_Syntax_Syntax.Tm_fvar fv,
                (tactic, FStar_Pervasives_Native.None)::(assertion,
                                                         FStar_Pervasives_Native.None)::[])
                 when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.by_tactic_lid
                 ->
                 (match pol1 with
                  | StrictlyPositive ->
                      let uu___2 =
                        run_tactic_on_typ tactic.FStar_Syntax_Syntax.pos
                          assertion.FStar_Syntax_Syntax.pos tactic e
                          assertion in
                      (match uu___2 with
                       | (gs, uu___3) ->
                           Simplified (FStar_Syntax_Util.t_true, gs))
                  | Pos ->
                      let uu___2 =
                        run_tactic_on_typ tactic.FStar_Syntax_Syntax.pos
                          assertion.FStar_Syntax_Syntax.pos tactic e
                          assertion in
                      (match uu___2 with
                       | (gs, uu___3) ->
                           Simplified (FStar_Syntax_Util.t_true, gs))
                  | Both ->
                      let uu___2 =
                        run_tactic_on_typ tactic.FStar_Syntax_Syntax.pos
                          assertion.FStar_Syntax_Syntax.pos tactic e
                          assertion in
                      (match uu___2 with
                       | (gs, uu___3) ->
                           Dual (assertion, FStar_Syntax_Util.t_true, gs))
                  | Neg -> Simplified (assertion, []))
             | (FStar_Syntax_Syntax.Tm_fvar fv,
                (assertion, FStar_Pervasives_Native.None)::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.spinoff_lid
                 ->
                 (match pol1 with
                  | StrictlyPositive ->
                      let uu___2 =
                        let uu___3 =
                          let uu___4 =
                            let uu___5 =
                              FStar_Tactics_Types.goal_of_goal_ty e assertion in
                            FStar_Compiler_Effect.op_Less_Bar
                              FStar_Pervasives_Native.fst uu___5 in
                          [uu___4] in
                        (FStar_Syntax_Util.t_true, uu___3) in
                      Simplified uu___2
                  | Pos ->
                      let uu___2 =
                        let uu___3 =
                          let uu___4 =
                            let uu___5 =
                              FStar_Tactics_Types.goal_of_goal_ty e assertion in
                            FStar_Compiler_Effect.op_Less_Bar
                              FStar_Pervasives_Native.fst uu___5 in
                          [uu___4] in
                        (FStar_Syntax_Util.t_true, uu___3) in
                      Simplified uu___2
                  | Both ->
                      let uu___2 =
                        let uu___3 =
                          let uu___4 =
                            let uu___5 =
                              FStar_Tactics_Types.goal_of_goal_ty e assertion in
                            FStar_Compiler_Effect.op_Less_Bar
                              FStar_Pervasives_Native.fst uu___5 in
                          [uu___4] in
                        (assertion, FStar_Syntax_Util.t_true, uu___3) in
                      Dual uu___2
                  | Neg -> Simplified (assertion, []))
             | (FStar_Syntax_Syntax.Tm_fvar fv,
                (tactic, FStar_Pervasives_Native.None)::(typ,
                                                         FStar_Pervasives_Native.Some
                                                         {
                                                           FStar_Syntax_Syntax.aqual_implicit
                                                             = true;
                                                           FStar_Syntax_Syntax.aqual_attributes
                                                             = uu___2;_})::
                (tm, FStar_Pervasives_Native.None)::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.rewrite_by_tactic_lid
                 ->
                 let uu___3 =
                   FStar_TypeChecker_Env.new_implicit_var_aux
                     "rewrite_with_tactic RHS" tm.FStar_Syntax_Syntax.pos e
                     typ FStar_Syntax_Syntax.Allow_untyped
                     FStar_Pervasives_Native.None in
                 (match uu___3 with
                  | (uvtm, uu___4, g_imp) ->
                      let u = e.FStar_TypeChecker_Env.universe_of e typ in
                      let goal =
                        let uu___5 = FStar_Syntax_Util.mk_eq2 u typ tm uvtm in
                        FStar_Syntax_Util.mk_squash
                          FStar_Syntax_Syntax.U_zero uu___5 in
                      let uu___5 =
                        run_tactic_on_typ tactic.FStar_Syntax_Syntax.pos
                          tm.FStar_Syntax_Syntax.pos tactic e goal in
                      (match uu___5 with
                       | (gs, uu___6) ->
                           ((match gs with
                             | [] -> ()
                             | uu___8 ->
                                 FStar_Errors.raise_error
                                   (FStar_Errors.Fatal_OpenGoalsInSynthesis,
                                     "rewrite_with_tactic left open goals")
                                   typ.FStar_Syntax_Syntax.pos);
                            (let g_imp1 =
                               FStar_TypeChecker_Rel.resolve_implicits_tac e
                                 g_imp in
                             FStar_Tactics_Interpreter.report_implicits
                               tm.FStar_Syntax_Syntax.pos
                               g_imp1.FStar_TypeChecker_Common.implicits;
                             Simplified (uvtm, [])))))
             | uu___2 -> Unchanged t)
let explode :
  'a . 'a tres_m -> ('a * 'a * FStar_Tactics_Types.goal Prims.list) =
  fun t ->
    match t with
    | Unchanged t1 -> (t1, t1, [])
    | Simplified (t1, gs) -> (t1, t1, gs)
    | Dual (tn, tp, gs) -> (tn, tp, gs)
let comb1 : 'a 'b . ('a -> 'b) -> 'a tres_m -> 'b tres_m =
  fun f ->
    fun uu___ ->
      match uu___ with
      | Unchanged t -> let uu___1 = f t in Unchanged uu___1
      | Simplified (t, gs) ->
          let uu___1 = let uu___2 = f t in (uu___2, gs) in Simplified uu___1
      | Dual (tn, tp, gs) ->
          let uu___1 =
            let uu___2 = f tn in let uu___3 = f tp in (uu___2, uu___3, gs) in
          Dual uu___1
let comb2 :
  'a 'b 'c . ('a -> 'b -> 'c) -> 'a tres_m -> 'b tres_m -> 'c tres_m =
  fun f ->
    fun x ->
      fun y ->
        match (x, y) with
        | (Unchanged t1, Unchanged t2) ->
            let uu___ = f t1 t2 in Unchanged uu___
        | (Unchanged t1, Simplified (t2, gs)) ->
            let uu___ = let uu___1 = f t1 t2 in (uu___1, gs) in
            Simplified uu___
        | (Simplified (t1, gs), Unchanged t2) ->
            let uu___ = let uu___1 = f t1 t2 in (uu___1, gs) in
            Simplified uu___
        | (Simplified (t1, gs1), Simplified (t2, gs2)) ->
            let uu___ =
              let uu___1 = f t1 t2 in
              (uu___1, (FStar_Compiler_List.op_At gs1 gs2)) in
            Simplified uu___
        | uu___ ->
            let uu___1 = explode x in
            (match uu___1 with
             | (n1, p1, gs1) ->
                 let uu___2 = explode y in
                 (match uu___2 with
                  | (n2, p2, gs2) ->
                      let uu___3 =
                        let uu___4 = f n1 n2 in
                        let uu___5 = f p1 p2 in
                        (uu___4, uu___5, (FStar_Compiler_List.op_At gs1 gs2)) in
                      Dual uu___3))
let comb_list : 'a . 'a tres_m Prims.list -> 'a Prims.list tres_m =
  fun rs ->
    let rec aux rs1 acc =
      match rs1 with
      | [] -> acc
      | hd::tl ->
          let uu___ = comb2 (fun l -> fun r -> l :: r) hd acc in aux tl uu___ in
    aux (FStar_Compiler_List.rev rs) (tpure [])
let emit : 'a . FStar_Tactics_Types.goal Prims.list -> 'a tres_m -> 'a tres_m
  =
  fun gs -> fun m -> comb2 (fun uu___ -> fun x -> x) (Simplified ((), gs)) m
let (non_strict : pol -> pol) =
  fun f -> match f with | StrictlyPositive -> Pos | uu___ -> f
let rec (traverse :
  (FStar_Syntax_Syntax.term -> Prims.bool) ->
    (pol -> FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> tres) ->
      pol -> FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> tres)
  =
  fun should_descend ->
    fun f ->
      fun pol1 ->
        fun e ->
          fun t ->
            let traverse1 = traverse should_descend in
            let r =
              let t1 = FStar_Syntax_Subst.compress t in
              let uu___ =
                let uu___1 = should_descend t1 in Prims.op_Negation uu___1 in
              if uu___
              then tpure t1.FStar_Syntax_Syntax.n
              else
                (match t1.FStar_Syntax_Syntax.n with
                 | FStar_Syntax_Syntax.Tm_uinst (t2, us) ->
                     let tr = traverse1 f pol1 e t2 in
                     let uu___2 =
                       comb1
                         (fun t' -> FStar_Syntax_Syntax.Tm_uinst (t', us)) in
                     uu___2 tr
                 | FStar_Syntax_Syntax.Tm_meta (t2, m) ->
                     let tr = traverse1 f pol1 e t2 in
                     let uu___2 =
                       comb1 (fun t' -> FStar_Syntax_Syntax.Tm_meta (t', m)) in
                     uu___2 tr
                 | FStar_Syntax_Syntax.Tm_app
                     ({
                        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar
                          fv;
                        FStar_Syntax_Syntax.pos = uu___2;
                        FStar_Syntax_Syntax.vars = uu___3;_},
                      (p, uu___4)::(q, uu___5)::[])
                     when
                     FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.imp_lid
                     ->
                     let x =
                       FStar_Syntax_Syntax.new_bv
                         FStar_Pervasives_Native.None p in
                     let r1 = traverse1 f (flip pol1) e p in
                     let r2 =
                       let uu___6 = FStar_TypeChecker_Env.push_bv e x in
                       traverse1 f pol1 uu___6 q in
                     comb2
                       (fun l ->
                          fun r3 ->
                            let uu___6 = FStar_Syntax_Util.mk_imp l r3 in
                            uu___6.FStar_Syntax_Syntax.n) r1 r2
                 | FStar_Syntax_Syntax.Tm_app
                     ({
                        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar
                          fv;
                        FStar_Syntax_Syntax.pos = uu___2;
                        FStar_Syntax_Syntax.vars = uu___3;_},
                      (p, uu___4)::(q, uu___5)::[])
                     when
                     FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.iff_lid
                     ->
                     let xp =
                       FStar_Syntax_Syntax.new_bv
                         FStar_Pervasives_Native.None p in
                     let xq =
                       FStar_Syntax_Syntax.new_bv
                         FStar_Pervasives_Native.None q in
                     let r1 =
                       let uu___6 = FStar_TypeChecker_Env.push_bv e xq in
                       traverse1 f Both uu___6 p in
                     let r2 =
                       let uu___6 = FStar_TypeChecker_Env.push_bv e xp in
                       traverse1 f Both uu___6 q in
                     (match (r1, r2) with
                      | (Unchanged uu___6, Unchanged uu___7) ->
                          comb2
                            (fun l ->
                               fun r3 ->
                                 let uu___8 = FStar_Syntax_Util.mk_iff l r3 in
                                 uu___8.FStar_Syntax_Syntax.n) r1 r2
                      | uu___6 ->
                          let uu___7 = explode r1 in
                          (match uu___7 with
                           | (pn, pp, gs1) ->
                               let uu___8 = explode r2 in
                               (match uu___8 with
                                | (qn, qp, gs2) ->
                                    let t2 =
                                      let uu___9 =
                                        FStar_Syntax_Util.mk_imp pn qp in
                                      let uu___10 =
                                        FStar_Syntax_Util.mk_imp qn pp in
                                      FStar_Syntax_Util.mk_conj uu___9
                                        uu___10 in
                                    Simplified
                                      ((t2.FStar_Syntax_Syntax.n),
                                        (FStar_Compiler_List.op_At gs1 gs2)))))
                 | FStar_Syntax_Syntax.Tm_app (hd, args) ->
                     let uu___2 =
                       let uu___3 =
                         let uu___4 = FStar_Syntax_Util.un_uinst hd in
                         uu___4.FStar_Syntax_Syntax.n in
                       (uu___3, args) in
                     (match uu___2 with
                      | (FStar_Syntax_Syntax.Tm_fvar fv,
                         (t2, FStar_Pervasives_Native.Some aq0)::(body, aq)::[])
                          when
                          ((FStar_Syntax_Syntax.fv_eq_lid fv
                              FStar_Parser_Const.forall_lid)
                             &&
                             (FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.exists_lid))
                            && aq0.FStar_Syntax_Syntax.aqual_implicit
                          ->
                          let r0 = traverse1 f pol1 e hd in
                          let rt = traverse1 f (flip pol1) e t2 in
                          let rbody = traverse1 f pol1 e body in
                          let rargs =
                            comb2
                              (fun t3 ->
                                 fun body1 ->
                                   [(t3, (FStar_Pervasives_Native.Some aq0));
                                   (body1, aq)]) rt rbody in
                          comb2
                            (fun hd1 ->
                               fun args1 ->
                                 FStar_Syntax_Syntax.Tm_app (hd1, args1)) r0
                            rargs
                      | uu___3 ->
                          let r0 = traverse1 f pol1 e hd in
                          let r1 =
                            FStar_Compiler_List.fold_right
                              (fun uu___4 ->
                                 fun r2 ->
                                   match uu___4 with
                                   | (a, q) ->
                                       let r' = traverse1 f pol1 e a in
                                       comb2
                                         (fun a1 ->
                                            fun args1 -> (a1, q) :: args1) r'
                                         r2) args (tpure []) in
                          comb2
                            (fun hd1 ->
                               fun args1 ->
                                 FStar_Syntax_Syntax.Tm_app (hd1, args1)) r0
                            r1)
                 | FStar_Syntax_Syntax.Tm_abs (bs, t2, k) ->
                     let uu___2 = FStar_Syntax_Subst.open_term bs t2 in
                     (match uu___2 with
                      | (bs1, topen) ->
                          let e' = FStar_TypeChecker_Env.push_binders e bs1 in
                          let r0 =
                            FStar_Compiler_List.map
                              (fun b ->
                                 let r1 =
                                   traverse1 f (flip pol1) e
                                     (b.FStar_Syntax_Syntax.binder_bv).FStar_Syntax_Syntax.sort in
                                 let uu___3 =
                                   comb1
                                     (fun s' ->
                                        {
                                          FStar_Syntax_Syntax.binder_bv =
                                            (let uu___4 =
                                               b.FStar_Syntax_Syntax.binder_bv in
                                             {
                                               FStar_Syntax_Syntax.ppname =
                                                 (uu___4.FStar_Syntax_Syntax.ppname);
                                               FStar_Syntax_Syntax.index =
                                                 (uu___4.FStar_Syntax_Syntax.index);
                                               FStar_Syntax_Syntax.sort = s'
                                             });
                                          FStar_Syntax_Syntax.binder_qual =
                                            (b.FStar_Syntax_Syntax.binder_qual);
                                          FStar_Syntax_Syntax.binder_attrs =
                                            (b.FStar_Syntax_Syntax.binder_attrs)
                                        }) in
                                 uu___3 r1) bs1 in
                          let rbs = comb_list r0 in
                          let rt = traverse1 f pol1 e' topen in
                          comb2
                            (fun bs2 ->
                               fun t3 ->
                                 let uu___3 = FStar_Syntax_Util.abs bs2 t3 k in
                                 uu___3.FStar_Syntax_Syntax.n) rbs rt)
                 | FStar_Syntax_Syntax.Tm_ascribed (t2, asc, ef) ->
                     let uu___2 = traverse1 f pol1 e t2 in
                     let uu___3 =
                       comb1
                         (fun t3 ->
                            FStar_Syntax_Syntax.Tm_ascribed (t3, asc, ef)) in
                     uu___3 uu___2
                 | FStar_Syntax_Syntax.Tm_match (sc, asc_opt, brs, lopt) ->
                     let uu___2 = traverse1 f pol1 e sc in
                     let uu___3 =
                       let uu___4 =
                         FStar_Compiler_List.map
                           (fun br ->
                              let uu___5 = FStar_Syntax_Subst.open_branch br in
                              match uu___5 with
                              | (pat, w, exp) ->
                                  let bvs = FStar_Syntax_Syntax.pat_bvs pat in
                                  let e1 =
                                    FStar_TypeChecker_Env.push_bvs e bvs in
                                  let r1 = traverse1 f pol1 e1 exp in
                                  let uu___6 =
                                    comb1
                                      (fun exp1 ->
                                         FStar_Syntax_Subst.close_branch
                                           (pat, w, exp1)) in
                                  uu___6 r1) brs in
                       comb_list uu___4 in
                     comb2
                       (fun sc1 ->
                          fun brs1 ->
                            FStar_Syntax_Syntax.Tm_match
                              (sc1, asc_opt, brs1, lopt)) uu___2 uu___3
                 | x -> tpure x) in
            match r with
            | Unchanged tn' ->
                f pol1 e
                  {
                    FStar_Syntax_Syntax.n = tn';
                    FStar_Syntax_Syntax.pos = (t.FStar_Syntax_Syntax.pos);
                    FStar_Syntax_Syntax.vars = (t.FStar_Syntax_Syntax.vars)
                  }
            | Simplified (tn', gs) ->
                let uu___ =
                  f pol1 e
                    {
                      FStar_Syntax_Syntax.n = tn';
                      FStar_Syntax_Syntax.pos = (t.FStar_Syntax_Syntax.pos);
                      FStar_Syntax_Syntax.vars = (t.FStar_Syntax_Syntax.vars)
                    } in
                emit gs uu___
            | Dual (tn, tp, gs) ->
                let rp =
                  f pol1 e
                    {
                      FStar_Syntax_Syntax.n = tp;
                      FStar_Syntax_Syntax.pos = (t.FStar_Syntax_Syntax.pos);
                      FStar_Syntax_Syntax.vars = (t.FStar_Syntax_Syntax.vars)
                    } in
                let uu___ = explode rp in
                (match uu___ with
                 | (uu___1, p', gs') ->
                     Dual
                       ({
                          FStar_Syntax_Syntax.n = tn;
                          FStar_Syntax_Syntax.pos =
                            (t.FStar_Syntax_Syntax.pos);
                          FStar_Syntax_Syntax.vars =
                            (t.FStar_Syntax_Syntax.vars)
                        }, p', (FStar_Compiler_List.op_At gs gs')))
let (preprocess :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_TypeChecker_Env.env * FStar_Syntax_Syntax.term *
        FStar_Options.optionstate) Prims.list)
  =
  fun env ->
    fun goal ->
      FStar_Errors.with_ctx "While preprocessing VC with a tactic"
        (fun uu___ ->
           (let uu___2 =
              FStar_TypeChecker_Env.debug env (FStar_Options.Other "Tac") in
            FStar_Compiler_Effect.op_Colon_Equals
              FStar_Tactics_Interpreter.tacdbg uu___2);
           (let uu___3 =
              FStar_Compiler_Effect.op_Bang FStar_Tactics_Interpreter.tacdbg in
            if uu___3
            then
              let uu___4 =
                let uu___5 = FStar_TypeChecker_Env.all_binders env in
                FStar_Compiler_Effect.op_Bar_Greater uu___5
                  (FStar_Syntax_Print.binders_to_string ",") in
              let uu___5 = FStar_Syntax_Print.term_to_string goal in
              FStar_Compiler_Util.print2 "About to preprocess %s |= %s\n"
                uu___4 uu___5
            else ());
           (let initial = (Prims.int_one, []) in
            let uu___3 =
              let uu___4 =
                traverse (fun uu___5 -> true) by_tactic_interp
                  StrictlyPositive env goal in
              match uu___4 with
              | Unchanged t' -> (t', [])
              | Simplified (t', gs) -> (t', gs)
              | uu___5 ->
                  failwith "preprocess: impossible, traverse returned a Dual" in
            match uu___3 with
            | (t', gs) ->
                ((let uu___5 =
                    FStar_Compiler_Effect.op_Bang
                      FStar_Tactics_Interpreter.tacdbg in
                  if uu___5
                  then
                    let uu___6 =
                      let uu___7 = FStar_TypeChecker_Env.all_binders env in
                      FStar_Compiler_Effect.op_Bar_Greater uu___7
                        (FStar_Syntax_Print.binders_to_string ", ") in
                    let uu___7 = FStar_Syntax_Print.term_to_string t' in
                    FStar_Compiler_Util.print2
                      "Main goal simplified to: %s |- %s\n" uu___6 uu___7
                  else ());
                 (let s = initial in
                  let s1 =
                    FStar_Compiler_List.fold_left
                      (fun uu___5 ->
                         fun g ->
                           match uu___5 with
                           | (n, gs1) ->
                               let phi =
                                 let uu___6 =
                                   let uu___7 =
                                     FStar_Tactics_Types.goal_env g in
                                   let uu___8 =
                                     FStar_Tactics_Types.goal_type g in
                                   getprop uu___7 uu___8 in
                                 match uu___6 with
                                 | FStar_Pervasives_Native.None ->
                                     let uu___7 =
                                       let uu___8 =
                                         let uu___9 =
                                           let uu___10 =
                                             FStar_Tactics_Types.goal_type g in
                                           FStar_Syntax_Print.term_to_string
                                             uu___10 in
                                         FStar_Compiler_Util.format1
                                           "Tactic returned proof-relevant goal: %s"
                                           uu___9 in
                                       (FStar_Errors.Fatal_TacticProofRelevantGoal,
                                         uu___8) in
                                     FStar_Errors.raise_error uu___7
                                       env.FStar_TypeChecker_Env.range
                                 | FStar_Pervasives_Native.Some phi1 -> phi1 in
                               ((let uu___7 =
                                   FStar_Compiler_Effect.op_Bang
                                     FStar_Tactics_Interpreter.tacdbg in
                                 if uu___7
                                 then
                                   let uu___8 =
                                     FStar_Compiler_Util.string_of_int n in
                                   let uu___9 =
                                     let uu___10 =
                                       FStar_Tactics_Types.goal_type g in
                                     FStar_Syntax_Print.term_to_string
                                       uu___10 in
                                   FStar_Compiler_Util.print2
                                     "Got goal #%s: %s\n" uu___8 uu___9
                                 else ());
                                (let label =
                                   let uu___7 =
                                     let uu___8 =
                                       FStar_Tactics_Types.get_label g in
                                     uu___8 = "" in
                                   if uu___7
                                   then
                                     let uu___8 =
                                       FStar_Compiler_Util.string_of_int n in
                                     Prims.op_Hat "Could not prove goal #"
                                       uu___8
                                   else
                                     (let uu___9 =
                                        let uu___10 =
                                          FStar_Compiler_Util.string_of_int n in
                                        let uu___11 =
                                          let uu___12 =
                                            let uu___13 =
                                              FStar_Tactics_Types.get_label g in
                                            Prims.op_Hat uu___13 ")" in
                                          Prims.op_Hat " (" uu___12 in
                                        Prims.op_Hat uu___10 uu___11 in
                                      Prims.op_Hat "Could not prove goal #"
                                        uu___9) in
                                 let gt' =
                                   FStar_TypeChecker_Util.label label
                                     goal.FStar_Syntax_Syntax.pos phi in
                                 let uu___7 =
                                   let uu___8 =
                                     let uu___9 =
                                       FStar_Tactics_Types.goal_env g in
                                     (uu___9, gt',
                                       (g.FStar_Tactics_Types.opts)) in
                                   uu___8 :: gs1 in
                                 ((n + Prims.int_one), uu___7)))) s gs in
                  let uu___5 = s1 in
                  match uu___5 with
                  | (uu___6, gs1) ->
                      let gs2 = FStar_Compiler_List.rev gs1 in
                      let uu___7 =
                        let uu___8 = FStar_Options.peek () in
                        (env, t', uu___8) in
                      uu___7 :: gs2))))
let rec (traverse_for_spinoff :
  pol ->
    (Prims.string * FStar_Compiler_Range.range)
      FStar_Pervasives_Native.option ->
      FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> tres)
  =
  fun pol1 ->
    fun label_ctx ->
      fun e ->
        fun t ->
          let debug =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "SpinoffAll") in
          let traverse1 pol2 e1 t1 =
            traverse_for_spinoff pol2 label_ctx e1 t1 in
          let should_descend' enable_debug t1 =
            let uu___ = FStar_Syntax_Util.head_and_args t1 in
            match uu___ with
            | (hd, args) ->
                let res =
                  let uu___1 =
                    let uu___2 = FStar_Syntax_Util.un_uinst hd in
                    uu___2.FStar_Syntax_Syntax.n in
                  match uu___1 with
                  | FStar_Syntax_Syntax.Tm_fvar fv ->
                      ((((FStar_Syntax_Syntax.fv_eq_lid fv
                            FStar_Parser_Const.and_lid)
                           ||
                           (FStar_Syntax_Syntax.fv_eq_lid fv
                              FStar_Parser_Const.imp_lid))
                          ||
                          (FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.forall_lid))
                         ||
                         (FStar_Syntax_Syntax.fv_eq_lid fv
                            FStar_Parser_Const.squash_lid))
                        ||
                        (FStar_Syntax_Syntax.fv_eq_lid fv
                           FStar_Parser_Const.auto_squash_lid)
                  | FStar_Syntax_Syntax.Tm_meta uu___2 -> true
                  | FStar_Syntax_Syntax.Tm_ascribed uu___2 -> true
                  | FStar_Syntax_Syntax.Tm_abs uu___2 -> true
                  | uu___2 -> false in
                (if debug && enable_debug
                 then
                   (let uu___2 = FStar_Compiler_Util.string_of_bool res in
                    let uu___3 = FStar_Syntax_Print.tag_of_term hd in
                    let uu___4 = FStar_Syntax_Print.term_to_string hd in
                    FStar_Compiler_Util.print3
                      "should_descend (%s) (%s) %s\n" uu___2 uu___3 uu___4)
                 else ();
                 res) in
          let should_descend = should_descend' true in
          let maybe_spinoff pol2 label_ctx1 e1 t1 =
            let label_goal t2 =
              let t3 =
                let uu___ =
                  let uu___1 =
                    let uu___2 = FStar_Syntax_Subst.compress t2 in
                    uu___2.FStar_Syntax_Syntax.n in
                  (uu___1, label_ctx1) in
                match uu___ with
                | (FStar_Syntax_Syntax.Tm_meta
                   (uu___1, FStar_Syntax_Syntax.Meta_labeled uu___2), uu___3)
                    -> t2
                | (uu___1, FStar_Pervasives_Native.Some (msg, r)) ->
                    FStar_TypeChecker_Util.label msg r t2
                | uu___1 -> t2 in
              let t4 =
                let uu___ = FStar_Syntax_Util.is_sub_singleton t3 in
                if uu___
                then t3
                else
                  FStar_Syntax_Util.mk_auto_squash FStar_Syntax_Syntax.U_zero
                    t3 in
              let uu___ = FStar_Tactics_Types.goal_of_goal_ty e1 t4 in
              FStar_Pervasives_Native.fst uu___ in
            let maybe_split_matches t2 =
              let uu___ =
                let uu___1 = FStar_Syntax_Subst.compress t2 in
                uu___1.FStar_Syntax_Syntax.n in
              match uu___ with
              | FStar_Syntax_Syntax.Tm_match (sc, asc_opt, branches, ret) ->
                  let retain_branch_i i br' =
                    FStar_Compiler_Effect.op_Bar_Greater branches
                      (FStar_Compiler_List.mapi
                         (fun j ->
                            fun br ->
                              if i = j
                              then br'
                              else
                                (let uu___2 = br in
                                 match uu___2 with
                                 | (pat, w, exp) ->
                                     (pat, w, FStar_Syntax_Util.t_true)))) in
                  let sub_goals =
                    let uu___1 =
                      FStar_Compiler_Effect.op_Bar_Greater branches
                        (FStar_Compiler_List.mapi
                           (fun i ->
                              fun br ->
                                let uu___2 =
                                  FStar_Syntax_Subst.open_branch br in
                                match uu___2 with
                                | (pat, w, exp) ->
                                    let bvs = FStar_Syntax_Syntax.pat_bvs pat in
                                    let e2 =
                                      FStar_TypeChecker_Env.push_bvs e1 bvs in
                                    let uu___3 = traverse1 pol2 e2 exp in
                                    (match uu___3 with
                                     | Unchanged t' ->
                                         let branches1 = retain_branch_i i br in
                                         let uu___4 =
                                           FStar_Syntax_Syntax.mk
                                             (FStar_Syntax_Syntax.Tm_match
                                                (sc, asc_opt, branches1, ret))
                                             t2.FStar_Syntax_Syntax.pos in
                                         [uu___4]
                                     | Simplified (t', gs) ->
                                         let branches_l =
                                           let uu___4 =
                                             let uu___5 =
                                               FStar_Syntax_Subst.close_branch
                                                 (pat, w, t') in
                                             retain_branch_i i uu___5 in
                                           let uu___5 =
                                             FStar_Compiler_Effect.op_Bar_Greater
                                               gs
                                               (FStar_Compiler_List.map
                                                  (fun g ->
                                                     let exp1 =
                                                       FStar_Tactics_Types.goal_type
                                                         g in
                                                     let uu___6 =
                                                       FStar_Syntax_Subst.close_branch
                                                         (pat, w, exp1) in
                                                     retain_branch_i i uu___6)) in
                                           uu___4 :: uu___5 in
                                         FStar_Compiler_Effect.op_Bar_Greater
                                           branches_l
                                           (FStar_Compiler_List.map
                                              (fun branches1 ->
                                                 FStar_Syntax_Syntax.mk
                                                   (FStar_Syntax_Syntax.Tm_match
                                                      (sc, asc_opt,
                                                        branches1, ret))
                                                   t2.FStar_Syntax_Syntax.pos))))) in
                    FStar_Compiler_Effect.op_Bar_Greater uu___1
                      FStar_Compiler_List.flatten in
                  FStar_Compiler_List.map label_goal sub_goals
              | uu___1 -> let uu___2 = label_goal t2 in [uu___2] in
            let spinoff t2 =
              match pol2 with
              | StrictlyPositive ->
                  let sub_goals = maybe_split_matches t2 in
                  Simplified (FStar_Syntax_Util.t_true, sub_goals)
              | uu___ -> Unchanged t2 in
            let t2 = FStar_Syntax_Subst.compress t1 in
            let uu___ =
              let uu___1 = should_descend' false t2 in
              Prims.op_Negation uu___1 in
            if uu___ then spinoff t2 else Unchanged t2 in
          let split_boolean_conjunction t1 =
            let uu___ = FStar_Syntax_Util.head_and_args t1 in
            match uu___ with
            | (hd, args) ->
                let uu___1 =
                  let uu___2 =
                    let uu___3 = FStar_Syntax_Util.un_uinst hd in
                    uu___3.FStar_Syntax_Syntax.n in
                  (uu___2, args) in
                (match uu___1 with
                 | (FStar_Syntax_Syntax.Tm_fvar fv, (t2, uu___2)::[]) when
                     FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.b2t_lid
                     ->
                     let uu___3 = FStar_Syntax_Util.head_and_args t2 in
                     (match uu___3 with
                      | (hd1, args1) ->
                          let uu___4 =
                            let uu___5 =
                              let uu___6 = FStar_Syntax_Util.un_uinst hd1 in
                              uu___6.FStar_Syntax_Syntax.n in
                            (uu___5, args1) in
                          (match uu___4 with
                           | (FStar_Syntax_Syntax.Tm_fvar fv1,
                              (t0, uu___5)::(t11, uu___6)::[]) when
                               FStar_Syntax_Syntax.fv_eq_lid fv1
                                 FStar_Parser_Const.op_And
                               -> FStar_Pervasives_Native.Some (t0, t11)
                           | uu___5 -> FStar_Pervasives_Native.None))
                 | uu___2 -> FStar_Pervasives_Native.None) in
          let traverse_ctx pol2 ctx e1 t1 =
            let print_lc uu___ =
              match uu___ with
              | (msg, rng) ->
                  let uu___1 = FStar_Compiler_Range.string_of_def_range rng in
                  let uu___2 = FStar_Compiler_Range.string_of_use_range rng in
                  FStar_Compiler_Util.format3 "(%s,%s) : %s" uu___1 uu___2
                    msg in
            if debug
            then
              (let uu___1 =
                 match label_ctx with
                 | FStar_Pervasives_Native.None -> "None"
                 | FStar_Pervasives_Native.Some lc -> print_lc lc in
               let uu___2 = print_lc ctx in
               FStar_Compiler_Util.print2
                 "Changing label context from %s to %s" uu___1 uu___2)
            else ();
            traverse_for_spinoff pol2 (FStar_Pervasives_Native.Some ctx) e1
              t1 in
          let uu___ = split_boolean_conjunction t in
          match uu___ with
          | FStar_Pervasives_Native.Some (t0, t1) ->
              let t2 =
                let uu___1 = FStar_Syntax_Util.b2t t0 in
                let uu___2 = FStar_Syntax_Util.b2t t1 in
                FStar_Syntax_Util.mk_conj uu___1 uu___2 in
              traverse1 pol1 e t2
          | uu___1 ->
              let r =
                let t1 = FStar_Syntax_Subst.compress t in
                let uu___2 =
                  let uu___3 = should_descend t1 in Prims.op_Negation uu___3 in
                if uu___2
                then tpure t1.FStar_Syntax_Syntax.n
                else
                  (match t1.FStar_Syntax_Syntax.n with
                   | FStar_Syntax_Syntax.Tm_uinst (t2, us) ->
                       let tr = traverse1 pol1 e t2 in
                       let uu___4 =
                         comb1
                           (fun t' -> FStar_Syntax_Syntax.Tm_uinst (t', us)) in
                       uu___4 tr
                   | FStar_Syntax_Syntax.Tm_meta
                       (t2, FStar_Syntax_Syntax.Meta_labeled
                        (msg, r1, uu___4))
                       ->
                       let tr = traverse_ctx pol1 (msg, r1) e t2 in
                       let uu___5 =
                         comb1
                           (fun t' ->
                              FStar_Syntax_Syntax.Tm_meta
                                (t',
                                  (FStar_Syntax_Syntax.Meta_labeled
                                     (msg, r1, false)))) in
                       uu___5 tr
                   | FStar_Syntax_Syntax.Tm_meta (t2, m) ->
                       let tr = traverse1 pol1 e t2 in
                       let uu___4 =
                         comb1
                           (fun t' -> FStar_Syntax_Syntax.Tm_meta (t', m)) in
                       uu___4 tr
                   | FStar_Syntax_Syntax.Tm_ascribed (t2, asc, ef) ->
                       let uu___4 = traverse1 pol1 e t2 in
                       let uu___5 =
                         comb1
                           (fun t3 ->
                              FStar_Syntax_Syntax.Tm_ascribed (t3, asc, ef)) in
                       uu___5 uu___4
                   | FStar_Syntax_Syntax.Tm_app
                       ({
                          FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar
                            fv;
                          FStar_Syntax_Syntax.pos = uu___4;
                          FStar_Syntax_Syntax.vars = uu___5;_},
                        (p, uu___6)::(q, uu___7)::[])
                       when
                       FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.imp_lid
                       ->
                       let x =
                         FStar_Syntax_Syntax.new_bv
                           FStar_Pervasives_Native.None p in
                       let r1 = traverse1 (flip pol1) e p in
                       let r2 =
                         let uu___8 = FStar_TypeChecker_Env.push_bv e x in
                         traverse1 pol1 uu___8 q in
                       comb2
                         (fun l ->
                            fun r3 ->
                              let uu___8 = FStar_Syntax_Util.mk_imp l r3 in
                              uu___8.FStar_Syntax_Syntax.n) r1 r2
                   | FStar_Syntax_Syntax.Tm_app (hd, args) ->
                       let uu___4 =
                         let uu___5 =
                           let uu___6 = FStar_Syntax_Util.un_uinst hd in
                           uu___6.FStar_Syntax_Syntax.n in
                         (uu___5, args) in
                       (match uu___4 with
                        | (FStar_Syntax_Syntax.Tm_fvar fv,
                           (t2, FStar_Pervasives_Native.Some aq0)::(body, aq)::[])
                            when
                            ((FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.forall_lid)
                               ||
                               (FStar_Syntax_Syntax.fv_eq_lid fv
                                  FStar_Parser_Const.exists_lid))
                              && aq0.FStar_Syntax_Syntax.aqual_implicit
                            ->
                            let r0 = traverse1 pol1 e hd in
                            let rt = traverse1 (flip pol1) e t2 in
                            let rbody = traverse1 pol1 e body in
                            let rargs =
                              comb2
                                (fun t3 ->
                                   fun body1 ->
                                     [(t3,
                                        (FStar_Pervasives_Native.Some aq0));
                                     (body1, aq)]) rt rbody in
                            comb2
                              (fun hd1 ->
                                 fun args1 ->
                                   FStar_Syntax_Syntax.Tm_app (hd1, args1))
                              r0 rargs
                        | uu___5 ->
                            let r0 = traverse1 pol1 e hd in
                            let r1 =
                              FStar_Compiler_List.fold_right
                                (fun uu___6 ->
                                   fun r2 ->
                                     match uu___6 with
                                     | (a, q) ->
                                         let r' = traverse1 pol1 e a in
                                         comb2
                                           (fun a1 ->
                                              fun args1 -> (a1, q) :: args1)
                                           r' r2) args (tpure []) in
                            comb2
                              (fun hd1 ->
                                 fun args1 ->
                                   FStar_Syntax_Syntax.Tm_app (hd1, args1))
                              r0 r1)
                   | FStar_Syntax_Syntax.Tm_abs (bs, t2, k) ->
                       let uu___4 = FStar_Syntax_Subst.open_term bs t2 in
                       (match uu___4 with
                        | (bs1, topen) ->
                            let e' = FStar_TypeChecker_Env.push_binders e bs1 in
                            let r0 =
                              FStar_Compiler_List.map
                                (fun b ->
                                   let r1 =
                                     traverse1 (flip pol1) e
                                       (b.FStar_Syntax_Syntax.binder_bv).FStar_Syntax_Syntax.sort in
                                   let uu___5 =
                                     comb1
                                       (fun s' ->
                                          {
                                            FStar_Syntax_Syntax.binder_bv =
                                              (let uu___6 =
                                                 b.FStar_Syntax_Syntax.binder_bv in
                                               {
                                                 FStar_Syntax_Syntax.ppname =
                                                   (uu___6.FStar_Syntax_Syntax.ppname);
                                                 FStar_Syntax_Syntax.index =
                                                   (uu___6.FStar_Syntax_Syntax.index);
                                                 FStar_Syntax_Syntax.sort =
                                                   s'
                                               });
                                            FStar_Syntax_Syntax.binder_qual =
                                              (b.FStar_Syntax_Syntax.binder_qual);
                                            FStar_Syntax_Syntax.binder_attrs
                                              =
                                              (b.FStar_Syntax_Syntax.binder_attrs)
                                          }) in
                                   uu___5 r1) bs1 in
                            let rbs = comb_list r0 in
                            let rt = traverse1 pol1 e' topen in
                            comb2
                              (fun bs2 ->
                                 fun t3 ->
                                   let uu___5 =
                                     FStar_Syntax_Util.abs bs2 t3 k in
                                   uu___5.FStar_Syntax_Syntax.n) rbs rt)
                   | x -> tpure x) in
              (match r with
               | Unchanged tn' ->
                   maybe_spinoff pol1 label_ctx e
                     {
                       FStar_Syntax_Syntax.n = tn';
                       FStar_Syntax_Syntax.pos = (t.FStar_Syntax_Syntax.pos);
                       FStar_Syntax_Syntax.vars =
                         (t.FStar_Syntax_Syntax.vars)
                     }
               | Simplified (tn', gs) ->
                   let uu___2 =
                     maybe_spinoff pol1 label_ctx e
                       {
                         FStar_Syntax_Syntax.n = tn';
                         FStar_Syntax_Syntax.pos =
                           (t.FStar_Syntax_Syntax.pos);
                         FStar_Syntax_Syntax.vars =
                           (t.FStar_Syntax_Syntax.vars)
                       } in
                   emit gs uu___2
               | Dual (tn, tp, gs) ->
                   let rp =
                     maybe_spinoff pol1 label_ctx e
                       {
                         FStar_Syntax_Syntax.n = tp;
                         FStar_Syntax_Syntax.pos =
                           (t.FStar_Syntax_Syntax.pos);
                         FStar_Syntax_Syntax.vars =
                           (t.FStar_Syntax_Syntax.vars)
                       } in
                   let uu___2 = explode rp in
                   (match uu___2 with
                    | (uu___3, p', gs') ->
                        Dual
                          ({
                             FStar_Syntax_Syntax.n = tn;
                             FStar_Syntax_Syntax.pos =
                               (t.FStar_Syntax_Syntax.pos);
                             FStar_Syntax_Syntax.vars =
                               (t.FStar_Syntax_Syntax.vars)
                           }, p', (FStar_Compiler_List.op_At gs gs'))))
let (pol_to_string : pol -> Prims.string) =
  fun uu___ ->
    match uu___ with
    | StrictlyPositive -> "StrictlyPositive"
    | Pos -> "Positive"
    | Neg -> "Negative"
    | Both -> "Both"
let (spinoff_strictly_positive_goals :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_TypeChecker_Env.env * FStar_Syntax_Syntax.term) Prims.list)
  =
  fun env ->
    fun goal ->
      let debug =
        FStar_TypeChecker_Env.debug env (FStar_Options.Other "SpinoffAll") in
      FStar_Errors.with_ctx "While spinning off all goals"
        (fun uu___ ->
           let initial = (Prims.int_one, []) in
           let uu___1 =
             let uu___2 =
               traverse_for_spinoff StrictlyPositive
                 FStar_Pervasives_Native.None env goal in
             match uu___2 with
             | Unchanged t' -> (t', [])
             | Simplified (t', gs) -> (t', gs)
             | uu___3 ->
                 failwith "preprocess: impossible, traverse returned a Dual" in
           match uu___1 with
           | (t', gs) ->
               let t'1 =
                 FStar_TypeChecker_Normalize.normalize
                   [FStar_TypeChecker_Env.Eager_unfolding;
                   FStar_TypeChecker_Env.Simplify;
                   FStar_TypeChecker_Env.Primops] env t' in
               ((let uu___3 =
                   let uu___4 = FStar_TypeChecker_Common.check_trivial t'1 in
                   FStar_TypeChecker_Common.uu___is_NonTrivial uu___4 in
                 if uu___3
                 then
                   let s =
                     let uu___4 =
                       let uu___5 = FStar_TypeChecker_Env.all_binders env in
                       FStar_Compiler_Effect.op_Bar_Greater uu___5
                         (FStar_Syntax_Print.binders_to_string ", ") in
                     let uu___5 = FStar_Syntax_Print.term_to_string t'1 in
                     FStar_Compiler_Util.format2
                       "Main goal simplified to: %s |- %s\n" uu___4 uu___5 in
                   let uu___4 =
                     let uu___5 = FStar_Syntax_Print.term_to_string goal in
                     FStar_Compiler_Util.format2
                       "Expected split_queries to trivialize the main goal;\nBut %s was simplified to\n%s\n"
                       uu___5 s in
                   failwith uu___4
                 else ());
                (let s = initial in
                 let s1 =
                   FStar_Compiler_List.fold_left
                     (fun uu___3 ->
                        fun g ->
                          match uu___3 with
                          | (n, gs1) ->
                              let phi = FStar_Tactics_Types.goal_type g in
                              (if debug
                               then
                                 (let uu___5 =
                                    FStar_Compiler_Util.string_of_int n in
                                  let uu___6 =
                                    let uu___7 =
                                      FStar_Tactics_Types.goal_type g in
                                    FStar_Syntax_Print.term_to_string uu___7 in
                                  FStar_Compiler_Util.print2
                                    "Got goal #%s: %s\n" uu___5 uu___6)
                               else ();
                               (let uu___5 =
                                  let uu___6 =
                                    let uu___7 =
                                      FStar_Tactics_Types.goal_env g in
                                    (uu___7, phi) in
                                  uu___6 :: gs1 in
                                ((n + Prims.int_one), uu___5)))) s gs in
                 let uu___3 = s1 in
                 match uu___3 with
                 | (uu___4, gs1) ->
                     let gs2 = FStar_Compiler_List.rev gs1 in
                     let gs3 =
                       FStar_Compiler_Effect.op_Bar_Greater gs2
                         (FStar_Compiler_List.filter_map
                            (fun uu___5 ->
                               match uu___5 with
                               | (env1, t) ->
                                   let t1 =
                                     FStar_TypeChecker_Normalize.normalize
                                       [FStar_TypeChecker_Env.Eager_unfolding;
                                       FStar_TypeChecker_Env.Simplify;
                                       FStar_TypeChecker_Env.Primops] env1 t in
                                   let uu___6 =
                                     FStar_TypeChecker_Common.check_trivial
                                       t1 in
                                   (match uu___6 with
                                    | FStar_TypeChecker_Common.Trivial ->
                                        FStar_Pervasives_Native.None
                                    | FStar_TypeChecker_Common.NonTrivial t2
                                        ->
                                        FStar_Pervasives_Native.Some
                                          (env1, t2)))) in
                     ((let uu___6 = FStar_TypeChecker_Env.get_range env in
                       let uu___7 =
                         let uu___8 =
                           FStar_Compiler_Util.string_of_int
                             (FStar_Compiler_List.length gs3) in
                         FStar_Compiler_Util.format1
                           "Split query into %s sub-goals" uu___8 in
                       FStar_Errors.diag uu___6 uu___7);
                      gs3))))
let (synthesize :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env ->
    fun typ ->
      fun tau ->
        FStar_Errors.with_ctx "While synthesizing term with a tactic"
          (fun uu___ ->
             if env.FStar_TypeChecker_Env.nosynth
             then
               let uu___1 =
                 FStar_TypeChecker_Util.fvar_const env
                   FStar_Parser_Const.magic_lid in
               let uu___2 =
                 let uu___3 =
                   FStar_Syntax_Syntax.as_arg FStar_Syntax_Util.exp_unit in
                 [uu___3] in
               FStar_Syntax_Syntax.mk_Tm_app uu___1 uu___2
                 typ.FStar_Syntax_Syntax.pos
             else
               ((let uu___3 =
                   FStar_TypeChecker_Env.debug env
                     (FStar_Options.Other "Tac") in
                 FStar_Compiler_Effect.op_Colon_Equals
                   FStar_Tactics_Interpreter.tacdbg uu___3);
                (let uu___3 =
                   run_tactic_on_typ tau.FStar_Syntax_Syntax.pos
                     typ.FStar_Syntax_Syntax.pos tau env typ in
                 match uu___3 with
                 | (gs, w) ->
                     (FStar_Compiler_List.iter
                        (fun g ->
                           let uu___5 =
                             let uu___6 = FStar_Tactics_Types.goal_env g in
                             let uu___7 = FStar_Tactics_Types.goal_type g in
                             getprop uu___6 uu___7 in
                           match uu___5 with
                           | FStar_Pervasives_Native.Some vc ->
                               ((let uu___7 =
                                   FStar_Compiler_Effect.op_Bang
                                     FStar_Tactics_Interpreter.tacdbg in
                                 if uu___7
                                 then
                                   let uu___8 =
                                     FStar_Syntax_Print.term_to_string vc in
                                   FStar_Compiler_Util.print1
                                     "Synthesis left a goal: %s\n" uu___8
                                 else ());
                                (let guard =
                                   {
                                     FStar_TypeChecker_Common.guard_f =
                                       (FStar_TypeChecker_Common.NonTrivial
                                          vc);
                                     FStar_TypeChecker_Common.deferred_to_tac
                                       = [];
                                     FStar_TypeChecker_Common.deferred = [];
                                     FStar_TypeChecker_Common.univ_ineqs =
                                       ([], []);
                                     FStar_TypeChecker_Common.implicits = []
                                   } in
                                 let uu___7 = FStar_Tactics_Types.goal_env g in
                                 FStar_TypeChecker_Rel.force_trivial_guard
                                   uu___7 guard))
                           | FStar_Pervasives_Native.None ->
                               FStar_Errors.raise_error
                                 (FStar_Errors.Fatal_OpenGoalsInSynthesis,
                                   "synthesis left open goals")
                                 typ.FStar_Syntax_Syntax.pos) gs;
                      w))))
let (solve_implicits :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_TypeChecker_Env.implicits -> unit)
  =
  fun env ->
    fun tau ->
      fun imps ->
        FStar_Errors.with_ctx "While solving implicits with a tactic"
          (fun uu___ ->
             if env.FStar_TypeChecker_Env.nosynth
             then ()
             else
               ((let uu___3 =
                   FStar_TypeChecker_Env.debug env
                     (FStar_Options.Other "Tac") in
                 FStar_Compiler_Effect.op_Colon_Equals
                   FStar_Tactics_Interpreter.tacdbg uu___3);
                (let gs =
                   let uu___3 = FStar_TypeChecker_Env.get_range env in
                   run_tactic_on_all_implicits tau.FStar_Syntax_Syntax.pos
                     uu___3 tau env imps in
                 FStar_Compiler_Effect.op_Bar_Greater gs
                   (FStar_Compiler_List.iter
                      (fun g ->
                         let uu___4 =
                           let uu___5 = FStar_Tactics_Types.goal_env g in
                           let uu___6 = FStar_Tactics_Types.goal_type g in
                           getprop uu___5 uu___6 in
                         match uu___4 with
                         | FStar_Pervasives_Native.Some vc ->
                             ((let uu___6 =
                                 FStar_Compiler_Effect.op_Bang
                                   FStar_Tactics_Interpreter.tacdbg in
                               if uu___6
                               then
                                 let uu___7 =
                                   FStar_Syntax_Print.term_to_string vc in
                                 FStar_Compiler_Util.print1
                                   "Synthesis left a goal: %s\n" uu___7
                               else ());
                              (let guard =
                                 {
                                   FStar_TypeChecker_Common.guard_f =
                                     (FStar_TypeChecker_Common.NonTrivial vc);
                                   FStar_TypeChecker_Common.deferred_to_tac =
                                     [];
                                   FStar_TypeChecker_Common.deferred = [];
                                   FStar_TypeChecker_Common.univ_ineqs =
                                     ([], []);
                                   FStar_TypeChecker_Common.implicits = []
                                 } in
                               let uu___6 = FStar_Tactics_Types.goal_env g in
                               FStar_TypeChecker_Rel.force_trivial_guard
                                 uu___6 guard))
                         | FStar_Pervasives_Native.None ->
                             let uu___5 = FStar_TypeChecker_Env.get_range env in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_OpenGoalsInSynthesis,
                                 "synthesis left open goals") uu___5)))))
let (find_user_tac_for_attr :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.sigelt FStar_Pervasives_Native.option)
  =
  fun env ->
    fun a ->
      let hooks =
        FStar_TypeChecker_Env.lookup_attr env
          FStar_Parser_Const.handle_smt_goals_attr_string in
      FStar_Compiler_Effect.op_Bar_Greater hooks
        (FStar_Compiler_Util.try_find (fun uu___ -> true))
let (handle_smt_goal :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.goal ->
      (FStar_TypeChecker_Env.env * FStar_Syntax_Syntax.term) Prims.list)
  =
  fun env ->
    fun goal ->
      let uu___ = FStar_TypeChecker_Common.check_trivial goal in
      match uu___ with
      | FStar_TypeChecker_Common.Trivial -> [(env, goal)]
      | FStar_TypeChecker_Common.NonTrivial goal1 ->
          let uu___1 =
            let uu___2 =
              FStar_Syntax_Syntax.tconst
                FStar_Parser_Const.handle_smt_goals_attr in
            find_user_tac_for_attr env uu___2 in
          (match uu___1 with
           | FStar_Pervasives_Native.Some tac ->
               let tau =
                 match tac.FStar_Syntax_Syntax.sigel with
                 | FStar_Syntax_Syntax.Sig_let (uu___2, lid::[]) ->
                     let qn = FStar_TypeChecker_Env.lookup_qname env lid in
                     let fv =
                       FStar_Syntax_Syntax.lid_as_fv lid
                         (FStar_Syntax_Syntax.Delta_constant_at_level
                            Prims.int_zero) FStar_Pervasives_Native.None in
                     let dd =
                       let uu___3 =
                         FStar_TypeChecker_Env.delta_depth_of_qninfo fv qn in
                       match uu___3 with
                       | FStar_Pervasives_Native.Some dd1 -> dd1
                       | FStar_Pervasives_Native.None ->
                           failwith "Expected a dd" in
                     let uu___3 =
                       FStar_Syntax_Syntax.lid_as_fv lid dd
                         FStar_Pervasives_Native.None in
                     FStar_Syntax_Syntax.fv_to_tm uu___3
                 | uu___2 -> failwith "Resolve_tac not found" in
               let gs =
                 FStar_Errors.with_ctx
                   "While handling an SMT goal with a tactic"
                   (fun uu___2 ->
                      (let uu___4 =
                         FStar_TypeChecker_Env.debug env
                           (FStar_Options.Other "Tac") in
                       FStar_Compiler_Effect.op_Colon_Equals
                         FStar_Tactics_Interpreter.tacdbg uu___4);
                      (let uu___4 =
                         let uu___5 = FStar_TypeChecker_Env.get_range env in
                         let uu___6 =
                           FStar_Syntax_Util.mk_squash
                             FStar_Syntax_Syntax.U_zero goal1 in
                         run_tactic_on_typ tau.FStar_Syntax_Syntax.pos uu___5
                           tau env uu___6 in
                       match uu___4 with
                       | (gs1, uu___5) ->
                           FStar_Compiler_Effect.op_Bar_Greater gs1
                             (FStar_Compiler_List.map
                                (fun g ->
                                   let uu___6 =
                                     let uu___7 =
                                       FStar_Tactics_Types.goal_env g in
                                     let uu___8 =
                                       FStar_Tactics_Types.goal_type g in
                                     getprop uu___7 uu___8 in
                                   match uu___6 with
                                   | FStar_Pervasives_Native.Some vc ->
                                       ((let uu___8 =
                                           FStar_Compiler_Effect.op_Bang
                                             FStar_Tactics_Interpreter.tacdbg in
                                         if uu___8
                                         then
                                           let uu___9 =
                                             FStar_Syntax_Print.term_to_string
                                               vc in
                                           FStar_Compiler_Util.print1
                                             "handle_smt_goals left a goal: %s\n"
                                             uu___9
                                         else ());
                                        (let uu___8 =
                                           FStar_Tactics_Types.goal_env g in
                                         (uu___8, vc)))
                                   | FStar_Pervasives_Native.None ->
                                       let uu___7 =
                                         FStar_TypeChecker_Env.get_range env in
                                       FStar_Errors.raise_error
                                         (FStar_Errors.Fatal_OpenGoalsInSynthesis,
                                           "Handling an SMT goal by tactic left non-prop open goals")
                                         uu___7)))) in
               gs
           | FStar_Pervasives_Native.None -> [(env, goal1)])
let (splice :
  FStar_TypeChecker_Env.env ->
    FStar_Compiler_Range.range ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.sigelt Prims.list)
  =
  fun env ->
    fun rng ->
      fun tau ->
        FStar_Errors.with_ctx "While running splice with a tactic"
          (fun uu___ ->
             if env.FStar_TypeChecker_Env.nosynth
             then []
             else
               ((let uu___3 =
                   FStar_TypeChecker_Env.debug env
                     (FStar_Options.Other "Tac") in
                 FStar_Compiler_Effect.op_Colon_Equals
                   FStar_Tactics_Interpreter.tacdbg uu___3);
                (let typ = FStar_Syntax_Syntax.t_decls in
                 let ps =
                   FStar_Tactics_Basic.proofstate_of_goals
                     tau.FStar_Syntax_Syntax.pos env [] [] in
                 let uu___3 =
                   let uu___4 =
                     FStar_Syntax_Embeddings.e_list
                       FStar_Reflection_Embeddings.e_sigelt in
                   FStar_Tactics_Interpreter.run_tactic_on_ps
                     tau.FStar_Syntax_Syntax.pos tau.FStar_Syntax_Syntax.pos
                     false FStar_Syntax_Embeddings.e_unit () uu___4 tau ps in
                 match uu___3 with
                 | (gs, sigelts) ->
                     ((let uu___5 =
                         FStar_Compiler_List.existsML
                           (fun g ->
                              let uu___6 =
                                let uu___7 =
                                  let uu___8 = FStar_Tactics_Types.goal_env g in
                                  let uu___9 =
                                    FStar_Tactics_Types.goal_type g in
                                  getprop uu___8 uu___9 in
                                FStar_Compiler_Option.isSome uu___7 in
                              Prims.op_Negation uu___6) gs in
                       if uu___5
                       then
                         FStar_Errors.raise_error
                           (FStar_Errors.Fatal_OpenGoalsInSynthesis,
                             "splice left open goals")
                           typ.FStar_Syntax_Syntax.pos
                       else ());
                      (let uu___6 =
                         FStar_Compiler_Effect.op_Bang
                           FStar_Tactics_Interpreter.tacdbg in
                       if uu___6
                       then
                         let uu___7 =
                           FStar_Common.string_of_list
                             FStar_Syntax_Print.sigelt_to_string sigelts in
                         FStar_Compiler_Util.print1
                           "splice: got decls = %s\n" uu___7
                       else ());
                      (let sigelts1 =
                         FStar_Compiler_Effect.op_Bar_Greater sigelts
                           (FStar_Compiler_List.map
                              (fun se ->
                                 (match se.FStar_Syntax_Syntax.sigel with
                                  | FStar_Syntax_Syntax.Sig_datacon uu___7 ->
                                      let uu___8 =
                                        let uu___9 =
                                          let uu___10 =
                                            FStar_Syntax_Print.sigelt_to_string_short
                                              se in
                                          FStar_Compiler_Util.format1
                                            "Tactic returned bad sigelt: %s\nIf you wanted to splice an inductive type, call `pack` providing a `Sg_Inductive` to get a proper sigelt."
                                            uu___10 in
                                        (FStar_Errors.Error_BadSplice,
                                          uu___9) in
                                      FStar_Errors.raise_error uu___8 rng
                                  | FStar_Syntax_Syntax.Sig_inductive_typ
                                      uu___7 ->
                                      let uu___8 =
                                        let uu___9 =
                                          let uu___10 =
                                            FStar_Syntax_Print.sigelt_to_string_short
                                              se in
                                          FStar_Compiler_Util.format1
                                            "Tactic returned bad sigelt: %s\nIf you wanted to splice an inductive type, call `pack` providing a `Sg_Inductive` to get a proper sigelt."
                                            uu___10 in
                                        (FStar_Errors.Error_BadSplice,
                                          uu___9) in
                                      FStar_Errors.raise_error uu___8 rng
                                  | uu___7 -> ());
                                 {
                                   FStar_Syntax_Syntax.sigel =
                                     (se.FStar_Syntax_Syntax.sigel);
                                   FStar_Syntax_Syntax.sigrng = rng;
                                   FStar_Syntax_Syntax.sigquals =
                                     (se.FStar_Syntax_Syntax.sigquals);
                                   FStar_Syntax_Syntax.sigmeta =
                                     (se.FStar_Syntax_Syntax.sigmeta);
                                   FStar_Syntax_Syntax.sigattrs =
                                     (se.FStar_Syntax_Syntax.sigattrs);
                                   FStar_Syntax_Syntax.sigopts =
                                     (se.FStar_Syntax_Syntax.sigopts)
                                 })) in
                       sigelts1)))))
let (mpreprocess :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env ->
    fun tau ->
      fun tm ->
        FStar_Errors.with_ctx
          "While preprocessing a definition with a tactic"
          (fun uu___ ->
             if env.FStar_TypeChecker_Env.nosynth
             then tm
             else
               ((let uu___3 =
                   FStar_TypeChecker_Env.debug env
                     (FStar_Options.Other "Tac") in
                 FStar_Compiler_Effect.op_Colon_Equals
                   FStar_Tactics_Interpreter.tacdbg uu___3);
                (let ps =
                   FStar_Tactics_Basic.proofstate_of_goals
                     tm.FStar_Syntax_Syntax.pos env [] [] in
                 let uu___3 =
                   FStar_Tactics_Interpreter.run_tactic_on_ps
                     tau.FStar_Syntax_Syntax.pos tm.FStar_Syntax_Syntax.pos
                     false FStar_Reflection_Embeddings.e_term tm
                     FStar_Reflection_Embeddings.e_term tau ps in
                 match uu___3 with | (gs, tm1) -> tm1)))
let (postprocess :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env ->
    fun tau ->
      fun typ ->
        fun tm ->
          FStar_Errors.with_ctx
            "While postprocessing a definition with a tactic"
            (fun uu___ ->
               if env.FStar_TypeChecker_Env.nosynth
               then tm
               else
                 ((let uu___3 =
                     FStar_TypeChecker_Env.debug env
                       (FStar_Options.Other "Tac") in
                   FStar_Compiler_Effect.op_Colon_Equals
                     FStar_Tactics_Interpreter.tacdbg uu___3);
                  (let uu___3 =
                     FStar_TypeChecker_Env.new_implicit_var_aux
                       "postprocess RHS" tm.FStar_Syntax_Syntax.pos env typ
                       FStar_Syntax_Syntax.Allow_untyped
                       FStar_Pervasives_Native.None in
                   match uu___3 with
                   | (uvtm, uu___4, g_imp) ->
                       let u = env.FStar_TypeChecker_Env.universe_of env typ in
                       let goal =
                         let uu___5 = FStar_Syntax_Util.mk_eq2 u typ tm uvtm in
                         FStar_Syntax_Util.mk_squash
                           FStar_Syntax_Syntax.U_zero uu___5 in
                       let uu___5 =
                         run_tactic_on_typ tau.FStar_Syntax_Syntax.pos
                           tm.FStar_Syntax_Syntax.pos tau env goal in
                       (match uu___5 with
                        | (gs, w) ->
                            (FStar_Compiler_List.iter
                               (fun g ->
                                  let uu___7 =
                                    let uu___8 =
                                      FStar_Tactics_Types.goal_env g in
                                    let uu___9 =
                                      FStar_Tactics_Types.goal_type g in
                                    getprop uu___8 uu___9 in
                                  match uu___7 with
                                  | FStar_Pervasives_Native.Some vc ->
                                      ((let uu___9 =
                                          FStar_Compiler_Effect.op_Bang
                                            FStar_Tactics_Interpreter.tacdbg in
                                        if uu___9
                                        then
                                          let uu___10 =
                                            FStar_Syntax_Print.term_to_string
                                              vc in
                                          FStar_Compiler_Util.print1
                                            "Postprocessing left a goal: %s\n"
                                            uu___10
                                        else ());
                                       (let guard =
                                          {
                                            FStar_TypeChecker_Common.guard_f
                                              =
                                              (FStar_TypeChecker_Common.NonTrivial
                                                 vc);
                                            FStar_TypeChecker_Common.deferred_to_tac
                                              = [];
                                            FStar_TypeChecker_Common.deferred
                                              = [];
                                            FStar_TypeChecker_Common.univ_ineqs
                                              = ([], []);
                                            FStar_TypeChecker_Common.implicits
                                              = []
                                          } in
                                        let uu___9 =
                                          FStar_Tactics_Types.goal_env g in
                                        FStar_TypeChecker_Rel.force_trivial_guard
                                          uu___9 guard))
                                  | FStar_Pervasives_Native.None ->
                                      FStar_Errors.raise_error
                                        (FStar_Errors.Fatal_OpenGoalsInSynthesis,
                                          "postprocessing left open goals")
                                        typ.FStar_Syntax_Syntax.pos) gs;
                             (let g_imp1 =
                                FStar_TypeChecker_Rel.resolve_implicits_tac
                                  env g_imp in
                              FStar_Tactics_Interpreter.report_implicits
                                tm.FStar_Syntax_Syntax.pos
                                g_imp1.FStar_TypeChecker_Common.implicits;
                              uvtm))))))