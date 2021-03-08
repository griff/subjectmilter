{ buildGoModule, fetchFromGitHub, lib }:
buildGoModule rec {
  pname = "subjectmilter";
  version = "0.1.0";

  src = ./.; /*fetchFromGitHub {
    owner = "griff";
    repo = "subjectmilter";
    rev = "v${version}";
    sha256 = "0m2fzpqxk7hrbxsgqplkg7h2p7gv6s1miymv3gvw0cz039skag0s";
  };*/

  vendorSha256 = "1mlil79zb3m7d5q3qjvjikmzq7w7i4cyrhi1pkw5qv2bp8zmcwjj";

  subPackages = [ "." ];

  deleteVendor = true;

  runVend = true;

  meta = with lib; {
    description = "Milter to support notls using subject, written in Go";
    homepage = "https://github.com/griff/subjectmilter";
    license = licenses.mit;
    #maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}