import 'package:untitled/models/shoes_brend.dart';

String brandName(ShoesBrand brand) {
  String name;

  if (brand == ShoesBrand.all) {
    name = 'All';
  } else if (brand == ShoesBrand.nike) {
    name = 'Nike';
  } else if (brand == ShoesBrand.addidas) {
    name = 'Adidas';
  } else if (brand == ShoesBrand.reebok) {
    name = 'Reebok';
  } else if (brand == ShoesBrand.puma) {
    name = 'Puma';
  } else {
    name = '';
  }
  return name;
}
String CategoryName(Worker_enum category) {
  String name;

  if (category == Worker_enum.all) 
  {
    name = 'All';
  } 
  else if (category == Worker_enum.engineer) 
  {
    name = 'engineer';
  } 
  else if (category == Worker_enum.plumber) 
  {
    name = 'plumber';
  } 
  else if (category == Worker_enum.doctor) 
  {
    name = 'doctor';
  } 
  else if (category == Worker_enum.carpenter) 
  {
    name = 'carpenter';
  } 
  else if (category == Worker_enum.electrician) 
  {
    name = 'electrician';
  }
  else if (category == Worker_enum.painter) 
  {
    name = 'painter';
  }
  else if (category == Worker_enum.barber) 
  {
    name = 'barber';
  }
  else if (category == Worker_enum.house_constructor) 
  {
    name = 'house_constructor';
  }
  else if (category == Worker_enum.mason) 
  {
    name = 'mason';
  }
  else if (category == Worker_enum.gardener) 
  {
    name = 'gardener';
  }
  else if (category == Worker_enum.cctv_installation) 
  {
    name = 'cctv_installation';
  }
  else if (category == Worker_enum.roofing_ceiling) 
  {
    name = 'roofing_ceiling';
  }
  else if (category == Worker_enum.welder) 
  {
    name = 'welder';
  }
  else if (category == Worker_enum.tailor) 
  {
    name = 'tailor';
  }
  else if (category == Worker_enum.ac_geyser_installation) 
  {
    name = 'ac_geyser_installation';
  }
  else if (category == Worker_enum.mobile_repair) 
  {
    name = 'mobile_repair';
  }
  else if (category == Worker_enum.maid) 
  {
    name = 'maid';
  }
  else {
    name = '';
  }
  return name;
}
