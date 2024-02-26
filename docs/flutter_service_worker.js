'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "145a58dc64ad413253ae93213976f54d",
"assets/AssetManifest.smcbin": "3684f764340a6f5f7669712085ccdd68",
"assets/assets/content.json": "c54508ed2dbfb2e9b7de3e0e82560f3c",
"assets/assets/projects/bankescape.png": "7e902b64467cd09397b0647d4fd6c850",
"assets/assets/projects/carecannon.png": "7c59b3940e40b28c55ef5586641d7538",
"assets/assets/projects/cheatingdeath.png": "7a4e0ee13976106d039f7b35c8f9bc26",
"assets/assets/projects/cheatingfate.png": "89e677a401dc4499f0a836be0f6689af",
"assets/assets/projects/cuttingboard.png": "7a50a48981ae9e23c5c85b10dc01ac93",
"assets/assets/projects/cuttingboard1.png": "b456ea7220c674852c4ec6df6e6ec1af",
"assets/assets/projects/cuttingboard2.png": "2eda3523b77bbc282b870e8481cb865f",
"assets/assets/projects/cuttingboard3.png": "ca77935f9ab72cf51686488f578fbffd",
"assets/assets/projects/dontdoit.png": "8cf78d587c2e3fe367d976d5d87b5e4d",
"assets/assets/projects/dontdoit2.png": "29102b6cbebe410c18da8c6ba730a974",
"assets/assets/projects/lightsout.png": "af7b3fbd1b26c985fd11da4d576c09e6",
"assets/assets/projects/paralyzis.png": "279d721f6378283d0698607fa697c250",
"assets/assets/projects/photoreddot.png": "9027fce0b6686bf21f44336a88b19a6a",
"assets/assets/projects/pyrolyzis.png": "9fa326c94259a1f110a0ddea0bb6b84b",
"assets/assets/projects/rippedapart.png": "cf2f19bd63ab3db2f355cb1edecaa21d",
"assets/assets/projects/theinterference.png": "f38aaee9deb52a42355f64aa796f4c9a",
"assets/assets/projects/uniatlas.png": "44c75ca73473876e144fcbd8079a5bd1",
"assets/assets/projects/uniatlas1.png": "938f99872f4653735984affb2fcb3bfe",
"assets/assets/projects/uniatlas2.png": "738855c82c65f19fb7dc67b8e574069d",
"assets/assets/projects/uniatlas3.png": "fb125afb417ccea1efbd3ddf3cd42194",
"assets/assets/teams/cuttingboard.png": "f1dee8d4fc013fd683f435ac5d6f73a0",
"assets/assets/teams/editor.psd": "c90ed72e87a9e3be79ac0ff709be4c43",
"assets/assets/teams/janggames.png": "524ef2f740127bb641d14dc83eb32feb",
"assets/assets/teams/jinganvil.png": "10c60557a51abe54a2bb1a99bb868781",
"assets/assets/teams/jnsquared.png": "6f35fe5adfacc459502f3a1761a1e2dc",
"assets/assets/teams/uniatlas.png": "69009af83736c886e82be201085c0480",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "caee083f0e370bfcc3e10708a4e0ec1b",
"assets/NOTICES": "ea1cc45e039034a82a2ebca5e163f559",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "9e632208bbf9ae68d59d92626ecfaa46",
"/": "9e632208bbf9ae68d59d92626ecfaa46",
"main.dart.js": "695452cc9c3806ddf94c64a80d30a861",
"manifest.json": "940592a263686a9df9ee2d0057b2a74e",
"version.json": "0955ff8db4ff2182911dd93357aeeea4"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
