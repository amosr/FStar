/* 
  This file was generated by KreMLin <https://github.com/FStarLang/kremlin>
  KreMLin invocation: /home/tahina/everest/mitls_dev/kremlin/krml -drop FStar.Tactics.\* -drop FStar.Tactics -drop FStar.Reflection.\* -bundle LowParseWriters.Test=LowParse.\*,LowParseWriters,LowParseWriters.\* -add-include "kremlin/internal/compat.h" -warn-error -9@4@2 -dast -skip-linking prims.krml FStar_Pervasives_Native.krml FStar_Pervasives.krml FStar_Mul.krml FStar_Squash.krml FStar_Classical.krml FStar_Preorder.krml FStar_Calc.krml FStar_StrongExcludedMiddle.krml FStar_List_Tot_Base.krml FStar_List_Tot_Properties.krml FStar_List_Tot.krml FStar_Seq_Base.krml FStar_FunctionalExtensionality.krml FStar_Seq_Properties.krml FStar_Seq.krml FStar_Math_Lib.krml FStar_Math_Lemmas.krml FStar_BitVector.krml FStar_UInt.krml FStar_UInt32.krml FStar_Int.krml FStar_Int16.krml FStar_Ghost.krml FStar_Set.krml FStar_ErasedLogic.krml FStar_PropositionalExtensionality.krml FStar_PredicateExtensionality.krml FStar_TSet.krml FStar_Monotonic_Heap.krml FStar_Heap.krml FStar_Map.krml FStar_Monotonic_Witnessed.krml FStar_Monotonic_HyperHeap.krml FStar_Monotonic_HyperStack.krml FStar_HyperStack.krml FStar_HyperStack_ST.krml Spec_Loops.krml FStar_UInt64.krml FStar_Universe.krml FStar_GSet.krml FStar_ModifiesGen.krml FStar_Range.krml FStar_Reflection_Types.krml FStar_Tactics_Types.krml FStar_Tactics_Result.krml FStar_Tactics_Effect.krml FStar_Reflection_Data.krml FStar_Tactics_Builtins.krml FStar_Reflection_Const.krml FStar_Order.krml FStar_Reflection_Builtins.krml FStar_Reflection_Derived.krml FStar_Reflection_Derived_Lemmas.krml FStar_Reflection.krml FStar_Tactics_Print.krml FStar_Tactics_SyntaxHelpers.krml FStar_Tactics_Util.krml FStar_Reflection_Formula.krml FStar_Tactics_Derived.krml FStar_Tactics_Logic.krml FStar_Tactics.krml FStar_BigOps.krml LowStar_Monotonic_Buffer.krml LowStar_Buffer.krml LowStar_BufferOps.krml C_Loops.krml LowParse_Math.krml FStar_UInt8.krml LowParse_Bytes.krml LowParse_Slice.krml LowParse_Spec_Base.krml LowParse_Low_Base_Spec.krml LowParse_Low_Base.krml LowParse_Spec_Combinators.krml LowParse_Spec_List.krml LowParse_Low_List.krml LowParse_Spec_FLData.krml LowParse_Low_Combinators.krml LowParse_Low_FLData.krml FStar_Int64.krml FStar_Int32.krml FStar_Int8.krml FStar_UInt16.krml FStar_Int_Cast.krml FStar_Endianness.krml LowParse_Spec_Seq.krml LowParse_Spec_Int.krml LowParse_Spec_BoundedInt.krml FStar_UInt128.krml LowStar_Endianness.krml LowParse_Low_Endianness.krml LowParse_BitFields.krml LowParse_Endianness.krml LowParse_Endianness_BitFields.krml LowParse_Low_BoundedInt.krml LowParse_Spec_SeqBytes_Base.krml LowParse_Spec_DER.krml LowParse_Spec_BCVLI.krml LowParse_Spec_AllIntegers.krml LowParse_Spec_VLData.krml LowParse_Low_VLData.krml LowParse_Spec_VLGen.krml LowParse_Low_VLGen.krml LowParse_Low_Int.krml LowParse_Low_DER.krml LowParse_Low_BCVLI.krml LowParse_Spec_Array.krml LowParse_Spec_VCList.krml LowParse_Low_VCList.krml LowParse_Spec_IfThenElse.krml LowParse_Low_IfThenElse.krml LowParse_TacLib.krml LowParse_Spec_Enum.krml LowParse_Spec_Sum.krml LowParse_Low_Enum.krml LowParse_Low_Sum.krml LowParse_Low_Tac_Sum.krml LowParse_Spec_Option.krml LowParse_Low_Option.krml LowStar_Modifies.krml FStar_Char.krml FStar_Exn.krml FStar_ST.krml FStar_All.krml FStar_List.krml FStar_String.krml FStar_Bytes.krml LowParse_Bytes32.krml LowParse_Spec_Bytes.krml LowParse_Low_Bytes.krml LowParse_Low_Array.krml LowParse_Low.krml FStar_IndefiniteDescription.krml FStar_Monotonic_Pure.krml LowParseWriters_LowParse.krml LowParseWriters.krml LowParseWriters_NoHoare.krml LowParseWriters_Parsers.krml LowParseWriters_NoHoare_Parsers.krml LowParseWriters_Compat.krml LowParseWriters_NoHoare_Compat.krml LowParseWriters_Test.krml
  F* version: 015b72e3
  KreMLin version: 0f08f124
 */

#include "LowParseWriters_Test.h"

typedef struct slice_s
{
  uint8_t *base;
  uint32_t len;
}
slice;

LowParseWriters_result__bool LowParseWriters_Test_test_read()
{
  LowParseWriters_result__bool
  scrut = { .tag = LowParseWriters_Correct, { .case_Correct = false } };
  if (scrut.tag == LowParseWriters_Correct)
  {
    LowParseWriters_result__bool
    scrut = { .tag = LowParseWriters_Correct, { .case_Correct = false } };
    if (scrut.tag == LowParseWriters_Correct)
    {
      LowParseWriters_result__bool
      scrut = { .tag = LowParseWriters_Correct, { .case_Correct = false } };
      if (scrut.tag == LowParseWriters_Correct)
        return
          (
            (LowParseWriters_result__bool){
              .tag = LowParseWriters_Correct,
              { .case_Correct = false }
            }
          );
      else if (scrut.tag == LowParseWriters_Error)
      {
        Prims_string e = scrut.case_Error;
        return
          ((LowParseWriters_result__bool){ .tag = LowParseWriters_Error, { .case_Error = e } });
      }
      else
      {
        KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
          __FILE__,
          __LINE__,
          "unreachable (pattern matches are exhaustive in F*)");
        KRML_HOST_EXIT(255U);
      }
    }
    else if (scrut.tag == LowParseWriters_Error)
    {
      Prims_string e = scrut.case_Error;
      return ((LowParseWriters_result__bool){ .tag = LowParseWriters_Error, { .case_Error = e } });
    }
    else
    {
      KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
        __FILE__,
        __LINE__,
        "unreachable (pattern matches are exhaustive in F*)");
      KRML_HOST_EXIT(255U);
    }
  }
  else if (scrut.tag == LowParseWriters_Error)
  {
    Prims_string e = scrut.case_Error;
    return ((LowParseWriters_result__bool){ .tag = LowParseWriters_Error, { .case_Error = e } });
  }
  else
  {
    KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
      __FILE__,
      __LINE__,
      "unreachable (pattern matches are exhaustive in F*)");
    KRML_HOST_EXIT(255U);
  }
}

LowParseWriters_result__bool LowParseWriters_Test_test_read_if_1()
{
  LowParseWriters_result__bool
  scrut = { .tag = LowParseWriters_Correct, { .case_Correct = false } };
  if (scrut.tag == LowParseWriters_Correct)
  {
    bool x = scrut.case_Correct;
    bool ite;
    if (x)
      ite = false;
    else
      ite = false;
    return
      ((LowParseWriters_result__bool){ .tag = LowParseWriters_Correct, { .case_Correct = ite } });
  }
  else if (scrut.tag == LowParseWriters_Error)
  {
    Prims_string e = scrut.case_Error;
    return ((LowParseWriters_result__bool){ .tag = LowParseWriters_Error, { .case_Error = e } });
  }
  else
  {
    KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
      __FILE__,
      __LINE__,
      "unreachable (pattern matches are exhaustive in F*)");
    KRML_HOST_EXIT(255U);
  }
}

LowParseWriters_result__uint32_t
LowParseWriters_Test_test_read_from_ptr(LowParseWriters_rptr b)
{
  return
    (
      (LowParseWriters_result__uint32_t){
        .tag = LowParseWriters_Correct,
        { .case_Correct = load32_be(b.rptr_base) }
      }
    );
}

LowParseWriters_result__uint32_t
LowParseWriters_Test_test_read_if_nontrivial(LowParseWriters_rptr b)
{
  LowParseWriters_result__uint32_t
  scrut = { .tag = LowParseWriters_Correct, { .case_Correct = load32_be(b.rptr_base) } };
  if (scrut.tag == LowParseWriters_Correct)
  {
    uint32_t x = scrut.case_Correct;
    uint32_t ite;
    if (x == (uint32_t)18U)
      ite = (uint32_t)42U;
    else
      ite = (uint32_t)1729U;
    return
      (
        (LowParseWriters_result__uint32_t){
          .tag = LowParseWriters_Correct,
          { .case_Correct = ite }
        }
      );
  }
  else if (scrut.tag == LowParseWriters_Error)
  {
    Prims_string e = scrut.case_Error;
    return
      ((LowParseWriters_result__uint32_t){ .tag = LowParseWriters_Error, { .case_Error = e } });
  }
  else
  {
    KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
      __FILE__,
      __LINE__,
      "unreachable (pattern matches are exhaustive in F*)");
    KRML_HOST_EXIT(255U);
  }
}

LowParseWriters_result__uint32_t
LowParseWriters_Test_test_read_if_really_nontrivial(
  LowParseWriters_rptr b,
  LowParseWriters_rptr c
)
{
  LowParseWriters_result__uint32_t
  scrut = { .tag = LowParseWriters_Correct, { .case_Correct = load32_be(b.rptr_base) } };
  if (scrut.tag == LowParseWriters_Correct)
  {
    uint32_t x = scrut.case_Correct;
    if (x == (uint32_t)18U)
      return
        (
          (LowParseWriters_result__uint32_t){
            .tag = LowParseWriters_Correct,
            { .case_Correct = load32_be(c.rptr_base) }
          }
        );
    else
      return
        (
          (LowParseWriters_result__uint32_t){
            .tag = LowParseWriters_Correct,
            { .case_Correct = (uint32_t)1729U }
          }
        );
  }
  else if (scrut.tag == LowParseWriters_Error)
  {
    Prims_string e = scrut.case_Error;
    return
      ((LowParseWriters_result__uint32_t){ .tag = LowParseWriters_Error, { .case_Error = e } });
  }
  else
  {
    KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
      __FILE__,
      __LINE__,
      "unreachable (pattern matches are exhaustive in F*)");
    KRML_HOST_EXIT(255U);
  }
}

#define None 0
#define Some 1

typedef uint8_t option__uint32_t_tags;

typedef struct option__uint32_t_s
{
  option__uint32_t_tags tag;
  uint32_t v;
}
option__uint32_t;

LowParseWriters_iresult____
LowParseWriters_Test_extract_write_two_ints_1(
  uint32_t x,
  uint32_t y,
  uint8_t *buf,
  uint32_t len,
  uint32_t pos
)
{
  uint8_t *b_ = buf + pos;
  option__uint32_t scrut0;
  if (len - pos < (uint32_t)4U)
    scrut0 = ((option__uint32_t){ .tag = None });
  else
  {
    store32_be(b_, x);
    uint32_t len1 = (uint32_t)4U;
    scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
  }
  LowParseWriters_iresult____ scrut1;
  if (scrut0.tag == None)
    scrut1 = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
  else if (scrut0.tag == Some)
  {
    uint32_t xlen = scrut0.v;
    scrut1 =
      (
        (LowParseWriters_iresult____){
          .tag = LowParseWriters_ICorrect,
          { .case_ICorrect = pos + xlen }
        }
      );
  }
  else
    scrut1 =
      KRML_EABORT(LowParseWriters_iresult____,
        "unreachable (pattern matches are exhaustive in F*)");
  if (scrut1.tag == LowParseWriters_IError)
  {
    Prims_string e = scrut1.case_IError;
    return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
  }
  else if (scrut1.tag == LowParseWriters_IOverflow)
    return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
  else if (scrut1.tag == LowParseWriters_ICorrect)
  {
    uint32_t posf = scrut1.case_ICorrect;
    uint8_t *buf_ = buf + posf;
    uint8_t *b_ = buf_;
    option__uint32_t scrut0;
    if (len - posf - (uint32_t)0U < (uint32_t)4U)
      scrut0 = ((option__uint32_t){ .tag = None });
    else
    {
      store32_be(b_, y);
      uint32_t len1 = (uint32_t)4U;
      scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
    }
    LowParseWriters_iresult____ scrut;
    if (scrut0.tag == None)
      scrut = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
    else if (scrut0.tag == Some)
    {
      uint32_t xlen = scrut0.v;
      scrut =
        (
          (LowParseWriters_iresult____){
            .tag = LowParseWriters_ICorrect,
            { .case_ICorrect = (uint32_t)0U + xlen }
          }
        );
    }
    else
      scrut =
        KRML_EABORT(LowParseWriters_iresult____,
          "unreachable (pattern matches are exhaustive in F*)");
    if (scrut.tag == LowParseWriters_IError)
    {
      Prims_string e = scrut.case_IError;
      return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
    }
    else if (scrut.tag == LowParseWriters_IOverflow)
      return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
    else if (scrut.tag == LowParseWriters_ICorrect)
    {
      uint32_t wlen = scrut.case_ICorrect;
      uint32_t pos_ = posf + wlen;
      return
        (
          (LowParseWriters_iresult____){
            .tag = LowParseWriters_ICorrect,
            { .case_ICorrect = pos_ }
          }
        );
    }
    else
    {
      KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
        __FILE__,
        __LINE__,
        "unreachable (pattern matches are exhaustive in F*)");
      KRML_HOST_EXIT(255U);
    }
  }
  else
  {
    KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
      __FILE__,
      __LINE__,
      "unreachable (pattern matches are exhaustive in F*)");
    KRML_HOST_EXIT(255U);
  }
}

LowParseWriters_iresult____
LowParseWriters_Test_extract_write_two_ints_2(
  uint32_t x,
  uint32_t y,
  uint8_t *buf,
  uint32_t len,
  uint32_t pos
)
{
  uint8_t *b_ = buf + pos;
  option__uint32_t scrut0;
  if (len - pos < (uint32_t)4U)
    scrut0 = ((option__uint32_t){ .tag = None });
  else
  {
    store32_be(b_, x);
    uint32_t len1 = (uint32_t)4U;
    scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
  }
  LowParseWriters_iresult____ scrut1;
  if (scrut0.tag == None)
    scrut1 = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
  else if (scrut0.tag == Some)
  {
    uint32_t xlen = scrut0.v;
    scrut1 =
      (
        (LowParseWriters_iresult____){
          .tag = LowParseWriters_ICorrect,
          { .case_ICorrect = pos + xlen }
        }
      );
  }
  else
    scrut1 =
      KRML_EABORT(LowParseWriters_iresult____,
        "unreachable (pattern matches are exhaustive in F*)");
  if (scrut1.tag == LowParseWriters_IError)
  {
    Prims_string e = scrut1.case_IError;
    return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
  }
  else if (scrut1.tag == LowParseWriters_IOverflow)
    return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
  else if (scrut1.tag == LowParseWriters_ICorrect)
  {
    uint32_t posf = scrut1.case_ICorrect;
    uint8_t *buf_ = buf + posf;
    uint8_t *b_ = buf_;
    option__uint32_t scrut0;
    if (len - posf - (uint32_t)0U < (uint32_t)4U)
      scrut0 = ((option__uint32_t){ .tag = None });
    else
    {
      store32_be(b_, y);
      uint32_t len1 = (uint32_t)4U;
      scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
    }
    LowParseWriters_iresult____ scrut;
    if (scrut0.tag == None)
      scrut = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
    else if (scrut0.tag == Some)
    {
      uint32_t xlen = scrut0.v;
      scrut =
        (
          (LowParseWriters_iresult____){
            .tag = LowParseWriters_ICorrect,
            { .case_ICorrect = (uint32_t)0U + xlen }
          }
        );
    }
    else
      scrut =
        KRML_EABORT(LowParseWriters_iresult____,
          "unreachable (pattern matches are exhaustive in F*)");
    if (scrut.tag == LowParseWriters_IError)
    {
      Prims_string e = scrut.case_IError;
      return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
    }
    else if (scrut.tag == LowParseWriters_IOverflow)
      return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
    else if (scrut.tag == LowParseWriters_ICorrect)
    {
      uint32_t wlen = scrut.case_ICorrect;
      uint32_t pos_ = posf + wlen;
      return
        (
          (LowParseWriters_iresult____){
            .tag = LowParseWriters_ICorrect,
            { .case_ICorrect = pos_ }
          }
        );
    }
    else
    {
      KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
        __FILE__,
        __LINE__,
        "unreachable (pattern matches are exhaustive in F*)");
      KRML_HOST_EXIT(255U);
    }
  }
  else
  {
    KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
      __FILE__,
      __LINE__,
      "unreachable (pattern matches are exhaustive in F*)");
    KRML_HOST_EXIT(255U);
  }
}

LowParseWriters_iresult____
LowParseWriters_Test_extract_write_two_ints_ifthenelse_2_aux(
  uint32_t x,
  uint32_t y,
  uint8_t *buf,
  uint32_t len,
  uint32_t pos
)
{
  uint8_t *b_ = buf + pos;
  option__uint32_t scrut0;
  if (len - pos < (uint32_t)4U)
    scrut0 = ((option__uint32_t){ .tag = None });
  else
  {
    store32_be(b_, x);
    uint32_t len1 = (uint32_t)4U;
    scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
  }
  LowParseWriters_iresult____ scrut1;
  if (scrut0.tag == None)
    scrut1 = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
  else if (scrut0.tag == Some)
  {
    uint32_t xlen = scrut0.v;
    scrut1 =
      (
        (LowParseWriters_iresult____){
          .tag = LowParseWriters_ICorrect,
          { .case_ICorrect = pos + xlen }
        }
      );
  }
  else
    scrut1 =
      KRML_EABORT(LowParseWriters_iresult____,
        "unreachable (pattern matches are exhaustive in F*)");
  if (scrut1.tag == LowParseWriters_IError)
  {
    Prims_string e = scrut1.case_IError;
    return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
  }
  else if (scrut1.tag == LowParseWriters_IOverflow)
    return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
  else if (scrut1.tag == LowParseWriters_ICorrect)
  {
    uint32_t posf = scrut1.case_ICorrect;
    if (x < y)
    {
      uint8_t *buf_ = buf + posf;
      uint8_t *b_ = buf_;
      option__uint32_t scrut0;
      if (len - posf - (uint32_t)0U < (uint32_t)4U)
        scrut0 = ((option__uint32_t){ .tag = None });
      else
      {
        store32_be(b_, x);
        uint32_t len1 = (uint32_t)4U;
        scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
      }
      LowParseWriters_iresult____ scrut;
      if (scrut0.tag == None)
        scrut = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
      else if (scrut0.tag == Some)
      {
        uint32_t xlen = scrut0.v;
        scrut =
          (
            (LowParseWriters_iresult____){
              .tag = LowParseWriters_ICorrect,
              { .case_ICorrect = (uint32_t)0U + xlen }
            }
          );
      }
      else
        scrut =
          KRML_EABORT(LowParseWriters_iresult____,
            "unreachable (pattern matches are exhaustive in F*)");
      if (scrut.tag == LowParseWriters_IError)
      {
        Prims_string e = scrut.case_IError;
        return
          ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
      }
      else if (scrut.tag == LowParseWriters_IOverflow)
        return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
      else if (scrut.tag == LowParseWriters_ICorrect)
      {
        uint32_t wlen = scrut.case_ICorrect;
        return
          (
            (LowParseWriters_iresult____){
              .tag = LowParseWriters_ICorrect,
              { .case_ICorrect = posf + wlen }
            }
          );
      }
      else
      {
        KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
          __FILE__,
          __LINE__,
          "unreachable (pattern matches are exhaustive in F*)");
        KRML_HOST_EXIT(255U);
      }
    }
    else
    {
      uint8_t *buf_ = buf + posf;
      uint8_t *b_ = buf_;
      option__uint32_t scrut0;
      if (len - posf - (uint32_t)0U < (uint32_t)4U)
        scrut0 = ((option__uint32_t){ .tag = None });
      else
      {
        store32_be(b_, y);
        uint32_t len1 = (uint32_t)4U;
        scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
      }
      LowParseWriters_iresult____ scrut;
      if (scrut0.tag == None)
        scrut = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
      else if (scrut0.tag == Some)
      {
        uint32_t xlen = scrut0.v;
        scrut =
          (
            (LowParseWriters_iresult____){
              .tag = LowParseWriters_ICorrect,
              { .case_ICorrect = (uint32_t)0U + xlen }
            }
          );
      }
      else
        scrut =
          KRML_EABORT(LowParseWriters_iresult____,
            "unreachable (pattern matches are exhaustive in F*)");
      if (scrut.tag == LowParseWriters_IError)
      {
        Prims_string e = scrut.case_IError;
        return
          ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
      }
      else if (scrut.tag == LowParseWriters_IOverflow)
        return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
      else if (scrut.tag == LowParseWriters_ICorrect)
      {
        uint32_t wlen = scrut.case_ICorrect;
        return
          (
            (LowParseWriters_iresult____){
              .tag = LowParseWriters_ICorrect,
              { .case_ICorrect = posf + wlen }
            }
          );
      }
      else
      {
        KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
          __FILE__,
          __LINE__,
          "unreachable (pattern matches are exhaustive in F*)");
        KRML_HOST_EXIT(255U);
      }
    }
  }
  else
  {
    KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
      __FILE__,
      __LINE__,
      "unreachable (pattern matches are exhaustive in F*)");
    KRML_HOST_EXIT(255U);
  }
}

uint32_t
LowParseWriters_Test___proj__Mkexample__item__left(LowParseWriters_Test_example projectee)
{
  return projectee.left;
}

uint32_t
LowParseWriters_Test___proj__Mkexample__item__right(LowParseWriters_Test_example projectee)
{
  return projectee.right;
}

LowParseWriters_Test_example
LowParseWriters_Test_synth_example(K___uint32_t_uint32_t uu____6435)
{
  uint32_t left = uu____6435.fst;
  uint32_t right = uu____6435.snd;
  return ((LowParseWriters_Test_example){ .left = left, .right = right });
}

K___uint32_t_uint32_t LowParseWriters_Test_synth_example_recip(LowParseWriters_Test_example e)
{
  return ((K___uint32_t_uint32_t){ .fst = e.left, .snd = e.right });
}

LowParseWriters_iresult____
LowParseWriters_Test_extract_write_example(
  uint32_t left,
  uint32_t right,
  uint8_t *buf,
  uint32_t len,
  uint32_t pos
)
{
  uint8_t *b_ = buf + pos;
  option__uint32_t scrut0;
  if (len - pos < (uint32_t)4U)
    scrut0 = ((option__uint32_t){ .tag = None });
  else
  {
    store32_be(b_, left);
    uint32_t len1 = (uint32_t)4U;
    scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
  }
  LowParseWriters_iresult____ scrut1;
  if (scrut0.tag == None)
    scrut1 = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
  else if (scrut0.tag == Some)
  {
    uint32_t xlen = scrut0.v;
    scrut1 =
      (
        (LowParseWriters_iresult____){
          .tag = LowParseWriters_ICorrect,
          { .case_ICorrect = pos + xlen }
        }
      );
  }
  else
    scrut1 =
      KRML_EABORT(LowParseWriters_iresult____,
        "unreachable (pattern matches are exhaustive in F*)");
  if (scrut1.tag == LowParseWriters_IError)
  {
    Prims_string e = scrut1.case_IError;
    return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
  }
  else if (scrut1.tag == LowParseWriters_IOverflow)
    return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
  else if (scrut1.tag == LowParseWriters_ICorrect)
  {
    uint32_t posf = scrut1.case_ICorrect;
    uint8_t *buf_ = buf + posf;
    uint8_t *b_ = buf_;
    option__uint32_t scrut0;
    if (len - posf - (uint32_t)0U < (uint32_t)4U)
      scrut0 = ((option__uint32_t){ .tag = None });
    else
    {
      store32_be(b_, right);
      uint32_t len1 = (uint32_t)4U;
      scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
    }
    LowParseWriters_iresult____ scrut;
    if (scrut0.tag == None)
      scrut = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
    else if (scrut0.tag == Some)
    {
      uint32_t xlen = scrut0.v;
      scrut =
        (
          (LowParseWriters_iresult____){
            .tag = LowParseWriters_ICorrect,
            { .case_ICorrect = (uint32_t)0U + xlen }
          }
        );
    }
    else
      scrut =
        KRML_EABORT(LowParseWriters_iresult____,
          "unreachable (pattern matches are exhaustive in F*)");
    if (scrut.tag == LowParseWriters_IError)
    {
      Prims_string e = scrut.case_IError;
      return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
    }
    else if (scrut.tag == LowParseWriters_IOverflow)
      return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
    else if (scrut.tag == LowParseWriters_ICorrect)
    {
      uint32_t wlen = scrut.case_ICorrect;
      uint32_t pos_ = posf + wlen;
      return
        (
          (LowParseWriters_iresult____){
            .tag = LowParseWriters_ICorrect,
            { .case_ICorrect = pos_ }
          }
        );
    }
    else
    {
      KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
        __FILE__,
        __LINE__,
        "unreachable (pattern matches are exhaustive in F*)");
      KRML_HOST_EXIT(255U);
    }
  }
  else
  {
    KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
      __FILE__,
      __LINE__,
      "unreachable (pattern matches are exhaustive in F*)");
    KRML_HOST_EXIT(255U);
  }
}

LowParseWriters_iresult____
LowParseWriters_Test_extract_write_two_ints(
  uint32_t left,
  uint32_t right,
  uint8_t *buf,
  uint32_t len,
  uint32_t pos
)
{
  uint32_t pos_pl0 = (uint32_t)1U;
  LowParseWriters_iresult____ scrut0;
  if (len < pos_pl0)
    scrut0 = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
  else
  {
    slice sl = { .base = buf, .len = len };
    sl.base[0U] = (uint8_t)(pos_pl0 - (uint32_t)1U);
    uint32_t len1 = (uint32_t)1U;
    uint32_t uu____0 = (uint32_t)0U + len1;
    scrut0 =
      (
        (LowParseWriters_iresult____){
          .tag = LowParseWriters_ICorrect,
          { .case_ICorrect = pos_pl0 }
        }
      );
  }
  if (scrut0.tag == LowParseWriters_IError)
  {
    Prims_string e = scrut0.case_IError;
    return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
  }
  else if (scrut0.tag == LowParseWriters_IOverflow)
    return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
  else if (scrut0.tag == LowParseWriters_ICorrect)
  {
    uint32_t posf = scrut0.case_ICorrect;
    uint8_t *buf_ = buf + posf;
    uint8_t *b_ = buf_;
    option__uint32_t scrut0;
    if (len - posf - (uint32_t)0U < (uint32_t)4U)
      scrut0 = ((option__uint32_t){ .tag = None });
    else
    {
      store32_be(b_, left);
      uint32_t len1 = (uint32_t)4U;
      scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
    }
    LowParseWriters_iresult____ scrut1;
    if (scrut0.tag == None)
      scrut1 = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
    else if (scrut0.tag == Some)
    {
      uint32_t xlen = scrut0.v;
      scrut1 =
        (
          (LowParseWriters_iresult____){
            .tag = LowParseWriters_ICorrect,
            { .case_ICorrect = (uint32_t)0U + xlen }
          }
        );
    }
    else
      scrut1 =
        KRML_EABORT(LowParseWriters_iresult____,
          "unreachable (pattern matches are exhaustive in F*)");
    LowParseWriters_iresult____ scrut2;
    if (scrut1.tag == LowParseWriters_IError)
    {
      Prims_string e = scrut1.case_IError;
      scrut2 =
        ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
    }
    else if (scrut1.tag == LowParseWriters_IOverflow)
      scrut2 = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
    else if (scrut1.tag == LowParseWriters_ICorrect)
    {
      uint32_t wlen = scrut1.case_ICorrect;
      uint32_t pos_ = posf + wlen;
      scrut2 =
        (
          (LowParseWriters_iresult____){
            .tag = LowParseWriters_ICorrect,
            { .case_ICorrect = pos_ }
          }
        );
    }
    else
      scrut2 =
        KRML_EABORT(LowParseWriters_iresult____,
          "unreachable (pattern matches are exhaustive in F*)");
    if (scrut2.tag == LowParseWriters_IError)
    {
      Prims_string e = scrut2.case_IError;
      return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
    }
    else if (scrut2.tag == LowParseWriters_IOverflow)
      return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
    else if (scrut2.tag == LowParseWriters_ICorrect)
    {
      uint32_t posf1 = scrut2.case_ICorrect;
      slice sl0 = { .base = buf, .len = len };
      uint32_t pos_pl0 = (uint32_t)1U;
      uint32_t sz = posf1 - pos_pl0;
      LowParseWriters_iresult____ scrut0;
      if ((uint32_t)0U <= sz && sz <= (uint32_t)255U)
      {
        sl0.base[0U] = (uint8_t)(posf1 - (uint32_t)1U);
        uint32_t len1 = (uint32_t)1U;
        uint32_t uu____1 = (uint32_t)0U + len1;
        scrut0 =
          (
            (LowParseWriters_iresult____){
              .tag = LowParseWriters_ICorrect,
              { .case_ICorrect = posf1 }
            }
          );
      }
      else
        scrut0 =
          (
            (LowParseWriters_iresult____){
              .tag = LowParseWriters_IError,
              { .case_IError = "parse_vllist_snoc_weak: out of bounds" }
            }
          );
      if (scrut0.tag == LowParseWriters_IError)
      {
        Prims_string e = scrut0.case_IError;
        return
          ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
      }
      else if (scrut0.tag == LowParseWriters_IOverflow)
        return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
      else if (scrut0.tag == LowParseWriters_ICorrect)
      {
        uint32_t posf2 = scrut0.case_ICorrect;
        uint8_t *buf_ = buf + posf2;
        uint8_t *b_ = buf_;
        option__uint32_t scrut0;
        if (len - posf2 - (uint32_t)0U < (uint32_t)4U)
          scrut0 = ((option__uint32_t){ .tag = None });
        else
        {
          store32_be(b_, right);
          uint32_t len1 = (uint32_t)4U;
          scrut0 = ((option__uint32_t){ .tag = Some, .v = (uint32_t)0U + len1 });
        }
        LowParseWriters_iresult____ scrut1;
        if (scrut0.tag == None)
          scrut1 = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
        else if (scrut0.tag == Some)
        {
          uint32_t xlen = scrut0.v;
          scrut1 =
            (
              (LowParseWriters_iresult____){
                .tag = LowParseWriters_ICorrect,
                { .case_ICorrect = (uint32_t)0U + xlen }
              }
            );
        }
        else
          scrut1 =
            KRML_EABORT(LowParseWriters_iresult____,
              "unreachable (pattern matches are exhaustive in F*)");
        LowParseWriters_iresult____ scrut;
        if (scrut1.tag == LowParseWriters_IError)
        {
          Prims_string e = scrut1.case_IError;
          scrut =
            ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
        }
        else if (scrut1.tag == LowParseWriters_IOverflow)
          scrut = ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
        else if (scrut1.tag == LowParseWriters_ICorrect)
        {
          uint32_t wlen = scrut1.case_ICorrect;
          uint32_t pos_ = posf2 + wlen;
          scrut =
            (
              (LowParseWriters_iresult____){
                .tag = LowParseWriters_ICorrect,
                { .case_ICorrect = pos_ }
              }
            );
        }
        else
          scrut =
            KRML_EABORT(LowParseWriters_iresult____,
              "unreachable (pattern matches are exhaustive in F*)");
        if (scrut.tag == LowParseWriters_IError)
        {
          Prims_string e = scrut.case_IError;
          return
            ((LowParseWriters_iresult____){ .tag = LowParseWriters_IError, { .case_IError = e } });
        }
        else if (scrut.tag == LowParseWriters_IOverflow)
          return ((LowParseWriters_iresult____){ .tag = LowParseWriters_IOverflow });
        else if (scrut.tag == LowParseWriters_ICorrect)
        {
          uint32_t posf3 = scrut.case_ICorrect;
          slice sl = { .base = buf, .len = len };
          uint32_t pos_pl = (uint32_t)1U;
          uint32_t sz = posf3 - pos_pl;
          if ((uint32_t)0U <= sz && sz <= (uint32_t)255U)
          {
            sl.base[0U] = (uint8_t)(posf3 - (uint32_t)1U);
            uint32_t len1 = (uint32_t)1U;
            uint32_t uu____2 = (uint32_t)0U + len1;
            return
              (
                (LowParseWriters_iresult____){
                  .tag = LowParseWriters_ICorrect,
                  { .case_ICorrect = posf3 }
                }
              );
          }
          else
            return
              (
                (LowParseWriters_iresult____){
                  .tag = LowParseWriters_IError,
                  { .case_IError = "parse_vllist_snoc_weak: out of bounds" }
                }
              );
        }
        else
        {
          KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
            __FILE__,
            __LINE__,
            "unreachable (pattern matches are exhaustive in F*)");
          KRML_HOST_EXIT(255U);
        }
      }
      else
      {
        KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
          __FILE__,
          __LINE__,
          "unreachable (pattern matches are exhaustive in F*)");
        KRML_HOST_EXIT(255U);
      }
    }
    else
    {
      KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
        __FILE__,
        __LINE__,
        "unreachable (pattern matches are exhaustive in F*)");
      KRML_HOST_EXIT(255U);
    }
  }
  else
  {
    KRML_HOST_EPRINTF("KreMLin abort at %s:%d\n%s\n",
      __FILE__,
      __LINE__,
      "unreachable (pattern matches are exhaustive in F*)");
    KRML_HOST_EXIT(255U);
  }
}

