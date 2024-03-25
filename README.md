# PhoenixThreejs

Minimal Phoenix ThreeJS setup

1. `cd assets/vendor/` and run `npm install --save three`
2. import three in `assets/js/app.js` 
```js
import * as THREE from "../vendor/node_modules/three/build/three.module.min.js"
window.THREE = THREE
```
3. add hooks
```js
let Hooks = {}
// ....
// ....
let liveSocket = new LiveSocket("/live", Socket, {
  ...
  hooks: Hooks,
})
```
4. write the hook for threejs 
```js
Hooks.ThreeExample = {
  mounted() {
    this.initThreeScene()
  },

  initThreeScene() {
    const scene = new THREE.Scene();
    const renderer = new THREE.WebGLRenderer();
    renderer.setSize( window.innerWidth, window.innerHeight );
    document.body.appendChild( renderer.domElement );
    // ...

    function animate() {
      requestAnimationFrame( animate );
      // ...
      renderer.render( scene, camera );
    }
    
    animate();
  }
}

```
5. call three from a LiveView site
```elixir
  def render(assigns) do
    ~H"""
    <h1>Running ThreeJS</h1>
    <div id="three-container" phx-hook="ThreeExample" phx-update="ignore"></div>
    """
  end
```