'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "0c1ab07122bfd17ee92f4a87807ff42f",
".git/config": "20d312206eb4991a969b00cc76909fbf",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "6ae5dd95b7fec93971885ea23d5002b3",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "d7d7279905374b35ac9ffbfc1c60b543",
".git/logs/refs/heads/gh-pages": "8a389c0452c80843c0349418ec6a58cb",
".git/logs/refs/heads/main": "616ea102e7dba3f57c35f562c1786bd1",
".git/logs/refs/remotes/origin/main": "448123be348f670a584bbe17d0c5ffae",
".git/objects/00/559eeb290fb8036f10633ff0640447d827b27c": "7fbd4486d5ea862eb2c1d2a07b06b395",
".git/objects/05/bc69705e21222f6e043d23df5f621448ce8f10": "0d5641bbd9585c084647fa8a908a87a9",
".git/objects/10/74e4dab4acf7024b98b6f3ed02da55df6889a3": "16d551833951b0d271436457e7905a1d",
".git/objects/11/eccef0e30a079a7ccb61c630fe84e4e170958f": "f5ede5c05953421e17f348d44bffa51c",
".git/objects/13/ae0de0f94c4323c91aab4c20f6412912b7e8f7": "fbbc3df61dd17aff6b0124068a99150b",
".git/objects/15/010c2aae31362571b7f5c793fc2881cd7593cd": "5dd03603fac7d9d7162c061de58481d4",
".git/objects/1f/ac07f7eeaaaa287e6386cc87ce345aa8e905ef": "81a7a4f796013c26054aedd2eb3b19f7",
".git/objects/20/3a3ff5cc524ede7e585dff54454bd63a1b0f36": "4b23a88a964550066839c18c1b5c461e",
".git/objects/20/e5b754160b346865993be963c6d58a706e67d2": "f5bdabdd402e95ca47b1c6cb176cb190",
".git/objects/22/2fd0baab4d1cbe4936fac0aa397ba4216aae2a": "57cf28a2d13911eb94169ff23bd609df",
".git/objects/26/bd9d0b1fdae0dd5b8587eb0ddba436cc4f3456": "75351b8f4206c98f9c0d814e3d58cfc8",
".git/objects/28/da2d173ee715f6409b97ff0da26493a1bc657b": "47b8863891f41fcd60dc34a2e4b5d06f",
".git/objects/29/f22f56f0c9903bf90b2a78ef505b36d89a9725": "e85914d97d264694217ae7558d414e81",
".git/objects/2c/9da4560401ca5acf55a14c2d546946fee2c3e5": "6d9ea260626d8d0ae702339f862e9427",
".git/objects/36/2639ff378e0f53fc48bcea314678e21a6fc30d": "15e0962e2eed2b95b03d8c1df6ce0fe1",
".git/objects/39/b4c7192380ca8d634cc150e06db5cf21f02754": "e382d6b417eb026d166ec86d3883a9cb",
".git/objects/3c/84353020a8b939a680d484fd89c1856279272d": "b3ada4c416708db2951a2faec84bf06d",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/43/a6dd033ca249238962381948ce06ead0ef8922": "5845d77084a53dbe2511801815e125b3",
".git/objects/45/b4d10e854ebc6a7ebcedbd658aa4fc17893b5a": "58b6d7aa6e3efb200bf63719df3fd630",
".git/objects/4d/bf9da7bcce5387354fe394985b98ebae39df43": "534c022f4a0845274cbd61ff6c9c9c33",
".git/objects/4f/fbe6ec4693664cb4ff395edf3d949bd4607391": "2beb9ca6c799e0ff64e0ad79f9e55e69",
".git/objects/50/521ec19e49620d0d824ce71245362bed5c9f34": "1421f5c9d3b9d4f059d7d5cd642fb9a0",
".git/objects/58/126d8e260dd7fd2b6fda6edc76b021d3b0fc96": "f80170439cbea29188d8ea9ef34929e2",
".git/objects/58/577fbad4bf1e08120927d02cdb126c03d5d847": "1ad00c9da394585b905fb82b3edf4ee4",
".git/objects/59/62efb2dffef4c259bda261b128fcab4b659c34": "11e1a7683fedc73b6a0da57ee3c6a112",
".git/objects/5c/c3cce847a20e3d6b6c3b12b9f7d6cee9375a64": "a4b2c069594c16282f234f08ec58e230",
".git/objects/5c/e84b521bf32e395d63bd38cfcd3582f9542537": "f871d11427dd434e17607668d21b95c3",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/69/ab5844256b3a56648d83ded461fac10158c9d2": "d8fb4cd29838fa7ebf49cec4ac16a725",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6b/cdcc27f22e001e46defdfd9e23f224ff65dd67": "624b5324c1f5198f7f6ede95410d5b7b",
".git/objects/6c/ee59a01f4a90b324361ce9ac3ae1f542b6f030": "b6d95defbd0b86887659da15c0989eaf",
".git/objects/71/c0f995ee64396f29a3d9ef283b5050f45d6e0f": "aa69ae6032786d8c915bfc9bd1c64c28",
".git/objects/7a/6c1911dddaea52e2dbffc15e45e428ec9a9915": "f1dee6885dc6f71f357a8e825bda0286",
".git/objects/83/280a4151e30af49623df6b6a404c67720b1ef8": "320d7a486d64040b2fbebc8712e1fca9",
".git/objects/85/e6e53a619b3a9504cfaccdf98a5bdca221e12e": "48f8a2f69efdaf35bb9234f3cba6d17c",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/88/fa8cf7b84dd96988e4faf10afa1fece35a1b16": "d3455ec1b9ee43d6d5c953286d13b847",
".git/objects/89/32c06b1d7f88163b636a6b0baf7e893df2109c": "ffacea44f7b0d6869818a57a2684ae67",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/96c9f3289fc5a513760eb5af06e1c784ee2db5": "2a1180ada7928956b0fb648ed1b0b181",
".git/objects/98/0d49437042d93ffa850a60d02cef584a35a85c": "8e18e4c1b6c83800103ff097cc222444",
".git/objects/9a/2f4bdbf5f1f4184eb7e248640a994f8acdaa69": "2069d2df5660ed10e8bdd450c94fd3cf",
".git/objects/9b/3ef5f169177a64f91eafe11e52b58c60db3df2": "91d370e4f73d42e0a622f3e44af9e7b1",
".git/objects/9c/731bdfc1935d1132743a9ac8803ba35cee6de0": "651ecbdd08b7e9cb51b427ee68f430aa",
".git/objects/9e/3b4630b3b8461ff43c272714e00bb47942263e": "accf36d08c0545fa02199021e5902d52",
".git/objects/9f/0c71b70a49664ced448c63edc9c4ff2bf8cf4a": "bfe12b0c8078a4f477699ecebf5fd96c",
".git/objects/9f/bb429fa6c624fc8533e2643ff03d82db734e81": "774eb3aef13f671c170075860ad63d48",
".git/objects/a2/9196d44e38cddb250876b124263d4dae31f15e": "7ef27627d6cf1a3f45117cf7591657d7",
".git/objects/a7/b53e291f610cf0f3e7d9f7245af0486e8cf410": "9d0b3583489980bfa9ce7e714e63e0db",
".git/objects/aa/da1c3057ca768b74baa27f80cbe820ca214dd9": "9cd16423ca556c0e1d3e024ea33068de",
".git/objects/ad/a3865a62e586a8db764b5c09b1a3801984875e": "138930b80a7761a81763baf4e6c147ef",
".git/objects/b0/60c65a65aace72f32810f7445677fce285bc54": "31adbcb7eac442ea0746f90d0ec37be8",
".git/objects/b6/b8806f5f9d33389d53c2868e6ea1aca7445229": "b14016efdbcda10804235f3a45562bbf",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/bc/36bcc2427a84e29e61ea7b634024072c04b206": "08cd2a4fd07be093532cedca2675ee60",
".git/objects/bf/73b4d927519ac27b69fe6b6458dc3d789ae3bf": "a030270490afc3aada7346c0ec1cfe18",
".git/objects/bf/88297539b091e8e4a004d37c72d711ed3a2787": "70a6b229e92cf94e4ed397e1aab82c28",
".git/objects/c2/6825bc40e4c7edfa136c542506c9ea9ecb8b42": "2e65c7f59db3ef9fcbfc5da1be5b7059",
".git/objects/c4/016f7d68c0d70816a0c784867168ffa8f419e1": "fdf8b8a8484741e7a3a558ed9d22f21d",
".git/objects/ca/0350c22bba576e2274644c59bb6da34deea815": "8197358e1e3ba50ec4a0b351b9723aa2",
".git/objects/ca/3bba02c77c467ef18cffe2d4c857e003ad6d5d": "316e3d817e75cf7b1fd9b0226c088a43",
".git/objects/d2/bca92f55a768ec485cb9e59284fdb7a8293fca": "dd14d5ea040e4f88fa9af771698406ac",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/5a22fe3e2218609fd9afe68975efba2dbd408c": "6498a2184e42c9353dbc5018967b8873",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d9/34578f4848fbd97bfc242b260c598a5f20a2a6": "583bc6fcd0574decbd3cc2ba01107eec",
".git/objects/dd/99d056984b1fec2197b82773ac3d529b6194da": "6b89a8ebbc1ecc78ff3eb14c6a4c7664",
".git/objects/df/7093608a7eb6173529ce9eeeb4d46e3a8290e5": "151239f49193115888a1b60c3a47cefb",
".git/objects/df/beef655535a32ca2516bcca2b8ca955c7bbb18": "a1422bd19b0a0daf91f2e3339e4339e1",
".git/objects/e1/49610c578c2e3f2b4592571828b5419d8d14a8": "a1271ab3b1a51f0ac460723c540eb28b",
".git/objects/e3/e9ee754c75ae07cc3d19f9b8c1e656cc4946a1": "14066365125dcce5aec8eb1454f0d127",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/eb/dc65c6e065adbea18e27d76659c581aca344cc": "05730d13f8870a497791108caaea7523",
".git/objects/ed/b55d4deb8363b6afa65df71d1f9fd8c7787f22": "886ebb77561ff26a755e09883903891d",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f8/8b2847e3e6a56f56055de38c20ad249fe5bed0": "d102d8395216ad4830da95a3d09bf67d",
".git/objects/fe/3914bcf3baf9d87a873a444cac8aaf9dcd54c1": "372add7dd6cdabc32b9333e8d66bff72",
".git/objects/fe/3b987e61ed346808d9aa023ce3073530ad7426": "dc7db10bf25046b27091222383ede515",
".git/objects/ff/a8a27df09230a1a17146c163d7f4a68657b449": "4e24586f60802bb74ca0bb36d9af1272",
".git/refs/heads/gh-pages": "07a92b4f839b8db94fd0a1db6bda5028",
".git/refs/heads/main": "07a92b4f839b8db94fd0a1db6bda5028",
".git/refs/remotes/origin/main": "99e2cf846928754e9f17bffb9c302d97",
"assets/AssetManifest.bin": "8f08b493c1a46b4df4b5afefca81e30b",
"assets/AssetManifest.bin.json": "162314fa3312c415253e9072bbcc91de",
"assets/AssetManifest.json": "c8e6c6842512815067294480d9d03354",
"assets/assets/fonts/Poppins-Black.ttf": "14d00dab1f6802e787183ecab5cce85e",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/images/Cpp.png": "782c5e55594bfafcd4b785e2c9c71c0c",
"assets/assets/images/dart.png": "7bf0c13894955f67112d309850406bd9",
"assets/assets/images/demo1.jpg": "71df10d57b941be1f7cb29df8d5d0a58",
"assets/assets/images/dsa.jpg": "2e72a771e534d299a6f31b083cd826ef",
"assets/assets/images/ecommerce1.jpg": "04cbc52b110c4d1c95d835fcf6c40c0e",
"assets/assets/images/ecommerce2.jpg": "95cf14b1ae8f7cfe743e73e79e80e4b5",
"assets/assets/images/ecommerce3.jpg": "4895da7da4b967ad300feb84ca7b0f5d",
"assets/assets/images/ecommerce4.jpg": "46b57e5038479e71cb9c23dbbb74e196",
"assets/assets/images/ecommerce5.jpg": "53c788ff0aed64f790acd5536970bb1f",
"assets/assets/images/firebase.png": "de1546f8bcc43f9252f70ff7509e468b",
"assets/assets/images/flutter.png": "218c4c5df83b068f8cb476f89832d5dd",
"assets/assets/images/git.png": "3646ba479abba83300728055e1dcb42a",
"assets/assets/images/java.png": "93a86e72cf37bc6430e5acc06954247d",
"assets/assets/images/karmad.webp": "5ed7d394ec04b003f7b5547cae0b80b0",
"assets/assets/images/profile_new.jpg": "482606f9cc0f7ac18498f367f661d3db",
"assets/assets/images/python.png": "6606c48fbf49fc629449aa11170b8c1c",
"assets/assets/images/tools1.jpg": "adfd23bcfa0ef3e436f0fcfa13a33729",
"assets/FontManifest.json": "05983c8daacd1dd87fd6fad730af6495",
"assets/fonts/MaterialIcons-Regular.otf": "214d762f868d072a3f0e8a8ac4241d4c",
"assets/NOTICES": "4727df1f7170980d903013196ac9b42d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "c435634d560e7d7dd78cceae6dbd0116",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "bf21cd8fd775a3c59fd53afdee39e0e6",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "c7bfcd0fd5d5047ea11bc2deab05d5f2",
"assets/packages/glass/images/noise.png": "326f70bd3633c4bb951eac0da073485d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "02d6f6fed460d38081a21b21da4e0191",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "aa3524b5f1b337a0285469f14225d0ad",
"/": "aa3524b5f1b337a0285469f14225d0ad",
"main.dart.js": "cd40e19f6f2a8b327cb412a5bc1a0ca5",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
