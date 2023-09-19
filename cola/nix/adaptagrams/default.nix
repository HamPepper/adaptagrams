{ stdenv
, cmake
, pkg-config
, makeWrapper
, cairomm
, lib
, useCairomm ? true
, enableHOLA ? false
}:

stdenv.mkDerivation {
  pname = "adaptagrams-fork";
  version = "20230918";

  src = ./../..;

  cmakeFlags = [ ]
  ++ (if useCairomm then [ "-DUSE_CAIROMM=ON" ] else [ "-DUSE_CAIROMM=OFF" ])
  ++ (if enableHOLA then [ "-DUSE_DIALECT=ON" ] else [ "-DUSE_DIALECT=OFF" ]);

  nativeBuildInputs = [ makeWrapper cmake pkg-config ];
  propagatedBuildInputs = [ ] ++ lib.optional (useCairomm) cairomm;
}
