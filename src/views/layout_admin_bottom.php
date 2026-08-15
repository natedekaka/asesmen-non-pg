    </div>
  </div>
</div>
<script>
function toggleSidebar() {
  document.getElementById('adminSidebar').classList.toggle('open');
  document.getElementById('sidebarOverlay').classList.toggle('show');
}
document.getElementById('adminSidebar').addEventListener('click', function (e) {
  if (window.innerWidth <= 768 && e.target.closest('a')) {
    document.getElementById('adminSidebar').classList.remove('open');
    document.getElementById('sidebarOverlay').classList.remove('show');
  }
});
</script>
</body>
</html>
