{ stdenv
, cmake
, pkg-config
, makeWrapper
, cairomm
, lib
, useCairomm ? true
}:

stdenv.mkDerivation {
  pname = "adaptagrams-fork";
  version = "20230918";

  src = ./../..;

  cmakeFlags = [ ]
  ++ (if useCairomm then [ "-DUSE_CAIROMM=ON" ] else [ "-DUSE_CAIROMM=OFF" ]);

  nativeBuildInputs = [ makeWrapper cmake pkg-config ];
  propagatedBuildInputs = [ ] ++ lib.optional (useCairomm) cairomm;
}
