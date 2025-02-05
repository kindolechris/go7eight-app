String getSessionTagNames({required int id}){
  switch (id) {
    case 0:
      return "Tech Gadgets";
    case 1:
      return "Smart Apparel";
    case 2:
      return "Smartphones";
    default:
      return "Shop Tech Now";
  }
}
