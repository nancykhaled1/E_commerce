
class CategoryOrBrandsResponseEntity {
  CategoryOrBrandsResponseEntity({
      this.results,
      this.data,});


  int? results;
  List<CategoryOrBrandsEntity>? data;



}


class CategoryOrBrandsEntity {
  CategoryOrBrandsEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      });


  String? id;
  String? name;
  String? slug;
  String? image;




}




