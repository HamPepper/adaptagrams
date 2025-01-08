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
  pname = "adaptagrams";
  version = "20240226";

  src = ./../cola;

  cmakeFlags = [ ]
  ++ (if useCairomm then [ "-DUSE_CAIROMM=ON" ] else [ "-DUSE_CAIROMM=OFF" ])
  ++ (if enableHOLA then [ "-DUSE_DIALECT=ON" ] else [ "-DUSE_DIALECT=OFF" ]);

  patches = [ ./preserve_debug_headers.patch ];

  nativeBuildInputs = [ makeWrapper cmake pkg-config ];
  propagatedBuildInputs = [ ] ++ lib.optional (useCairomm) cairomm;
}
