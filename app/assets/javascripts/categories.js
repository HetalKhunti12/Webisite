var categories = angular.module('Category', ['ngResource']);
categories.factory("Category", function($resource) {
  return $resource("categories/:id", { id: '@id1' }, {
    index:   { method: 'GET', isArray: true, responseType: 'json' },
    show:    { method: 'GET', responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})

// alert(categories)
categories.controller("categoriesController", function($scope, Category) {
  $scope.categories = Category.index();

  $scope.addCategory = function() {
    category = Category.save($scope.newCategory)

    $scope.categories.push(category)
    $scope.newCategory = {}
  }

  $scope.deleteCategory = function(index) {
    category = $scope.categories[index]
    Category.delete(category)
    $scope.categories.splice(index, 1);
  }

  $scope.showCategory = function(id1) {
    // category = $scope.categories[15]
    $scope.category = Category.show(id1);
    // Category.show(id1)
    // $scope.category = Category.show(id1);
    // Category.delete(category)
    // $scope.categories.splice(index, 1);
  }
})