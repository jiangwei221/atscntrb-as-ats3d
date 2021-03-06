#include
"share/atspre_staload.hats"

staload "./../../SATS/image/PPM.sats"

#define ATS_DYNLOADFLAG 0

implement
save_PGM {m,n} (fp, mat, m, n) = {
//
  val () = fprintln!(fp, "P2")
  val () = fprintln!(fp, "# generated by ATS/Postiats")
  val () = fprintln!(fp, n, " ", m)
  val () = fprintln!(fp, "255") // max color value
//
  implement
  fprint_matrix$sep1<> (out) = fprint!(out, " ")
  implement
  fprint_matrix$sep2<> (out) = fprintln!(out)
  implement
  fprint_ref<uint8> (out, x) = {
    val c = g0uint2uint_uint8_uint (x)
    val () = fprint!(fp, c)
  }
  val () = fprint_matrix<uint8> (fp, mat, m, n)
//
} (* end of [save_PPM1] *)

implement
save_PPM {m,n} (fp, mat, m, n) = {
//
  val () = fprintln!(fp, "P3")
  val () = fprintln!(fp, "# generated by ATS/Postiats")
  val () = fprintln!(fp, n, " ", m)
  val () = fprintln!(fp, "255") // max color value
//
  implement
  fprint_matrix$sep1<> (out) = fprint!(out, " ")
  implement
  fprint_matrix$sep2<> (out) = fprintln!(out)
  implement
  fprint_ref<uint32> (out, x) = {
    val c = g0uint2uint_uint32_uint (x)
    val r = (c >> 0) land 0xFFu
    val g = (c >> 8) land 0xFFu
    val b = (c >> 16) land 0xFFu
    val () = fprint!(fp, r, " ", g, " ", b)
  }
  val () = fprint_matrix<uint32> (fp, mat, m, n)

  //some bug in mac preview, it requires an empty line in the end
  val () = fprintln!(fp)
//
}

(* ****** ****** *)
